import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = Text("Escolha sua jogada");

  void _opcaoSelec(String escolhauser) {
    //print("opcção selec: $escolhauser");
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    //print("Escolha do app: $escolhaApp");
    //print("escolha usuario: $escolhauser");

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
    }

    if ( // ! user ganhador
        (escolhauser == "pedra" && escolhaApp == "tesoura") ||
            (escolhauser == "papel" && escolhaApp == "pedra") ||
            (escolhauser == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = Text("Bouua, você ganhou ^^");
      });
    } //! app ganhador
    else if ((escolhaApp == "pedra" && escolhauser == "tesoura") ||
        (escolhaApp == "papel" && escolhauser == "pedra") ||
        (escolhaApp == "tesoura" && escolhauser == "papel")) {
      setState(() {
        this._mensagem = Text("PC ganhou e você perdeu haha");
      });
    } // ! ngm ganha
    else {
      setState(() {
        this._mensagem = Text("Draw Game, Ninguém Ganhou");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ? Espaço do Body para colocar as coisas
              // text
              Text("Escolha do APP:"),
              // imagem
              Image(image: this._imagemApp, height: 100),
              //text
              this._mensagem,
              //linha de imagens
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        _opcaoSelec("pedra");
                      },
                      child: Image.asset("images/pedra.png", height: 90)),
                  GestureDetector(
                      onTap: () {
                        _opcaoSelec("papel");
                      },
                      child: Image.asset("images/papel.png", height: 90)),
                  GestureDetector(
                      onTap: () {
                        _opcaoSelec("tesoura");
                      },
                      child: Image.asset("images/tesoura.png", height: 90)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
