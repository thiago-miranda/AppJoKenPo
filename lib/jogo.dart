import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  String _mensagem = "Escolha uma opção abaixo";
  var _escolhaBorderUsuario;
  int _vitorias = 0;
  int _derrotas = 0;
  int _empate = 0;

  void _resetar() {
    setState(() {
      this._vitorias = 0;
      this._derrotas = 0;
      this._empate = 0;
      this._escolhaBorderUsuario = "padrao";
    });
  }

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    this._escolhaBorderUsuario = escolhaUsuario;

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      default:
        setState(() {
          this._imagemApp = AssetImage("images/padrao.png");
        });
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabénss!! você ganhou! :)";
        this._vitorias++;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "você perdeu :(";
        this._derrotas++;
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._mensagem = "Empate";
        this._empate++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JoKenPo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Image(
              image: this._imagemApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: this._escolhaBorderUsuario == "pedra"
                        ? Colors.blue
                        : Colors.grey,
                    child: Image.asset(
                      "images/pedra.png",
                      height: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: this._escolhaBorderUsuario == "papel"
                        ? Colors.blue
                        : Colors.grey,
                    child: Image.asset(
                      "images/papel.png",
                      height: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: this._escolhaBorderUsuario == "tesoura"
                        ? Colors.blue
                        : Colors.grey,
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),
            Text(
              "Pontuação",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Vitórias: ${this._vitorias}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "Perdeu: ${this._derrotas}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "Empate: ${this._empate}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: RaisedButton(
                onPressed: _resetar,
                color: Colors.blue,
                child: Text(
                  "Resetar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
