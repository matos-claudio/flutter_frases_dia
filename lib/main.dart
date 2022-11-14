import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeStateFul(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeStateFul extends StatefulWidget {
  const HomeStateFul({Key? key}) : super(key: key);

  @override
  State<HomeStateFul> createState() => _HomeStateFulState();
}

class _HomeStateFulState extends State<HomeStateFul> {
  static const _title = "Frases do dia";
  final List<String> _frases = [
    "Nem todas as tempestades vêm para atrapalhar a sua vida. Algumas vêm para limpar seu caminho.",
    "A persistência realiza o impossível.",
    "Não se desespere quando a caminhada estiver difícil, é sinal de que você está no caminho certo.",
    "Seus sonhos não precisam de plateia, eles só precisam de você."
  ];

  String _fraseGerada = "Clique abaixo para gerar a frase!";

  void _gerarFrase() {
    int numeroRandomico = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroRandomico];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png", fit: BoxFit.contain),
            Text(
              _fraseGerada,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    _gerarFrase();
                  },
                  child: const Text("Nova Frase")),
            )
          ],
        ),
      ),
    );
  }
}
