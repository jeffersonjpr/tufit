import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:tufit/controllers/autenticacao_controller.dart';

enum SingingCharacter { mas, fem }

class CadastroPage extends StatelessWidget {
  final controller = Get.put(AutenticacaoController());
  //implementar o acesso ao db
  //implementar o firebase.storage para guardar a imagem

  @override
  SingingCharacter _character = SingingCharacter.mas;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email invalido!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informa sua senha!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Idade',
                        ),
                      ),
                    ),
                    RadioListTile<SingingCharacter>(
                        title: const Text('Masculino'),
                        value: SingingCharacter.mas,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          GetXState();
                          //_character = value;
                        }),
                    RadioListTile<SingingCharacter>(
                        title: const Text('Feminino'),
                        value: SingingCharacter.fem,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          GetXState();
                          //_character = value;
                        }),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Altura(m)',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Peso(kg)',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState.validate()) {
                            controller.login();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Obx(() => Text(
                                  controller.botaoPrincipal.value,
                                  style: TextStyle(fontSize: 20))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
