import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void _register() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('fullName', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setBool('isAuthenticated', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'ФИО')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Телефон')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}