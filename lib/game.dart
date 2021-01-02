import 'package:flutter/material.dart';
import './button.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Button> gamebuttons;
  var p1;
  var p2;
  var acp;
  var moves;
  String display;

  @override
  void initState() {
    super.initState();
    gamebuttons = setgame();
  }

  List<Button> setgame() {
    p1 = new List();
    p2 = new List();
    acp = 1;
    moves = 0;
    display = "X to Play!";
    var buttons = <Button>[
      new Button(id: 1),
      new Button(id: 2),
      new Button(id: 3),
      new Button(id: 4),
      new Button(id: 5),
      new Button(id: 6),
      new Button(id: 7),
      new Button(id: 8),
      new Button(id: 9),
    ];
    return buttons;
  }

  void playgame(Button b) {
    setState(() {
      moves = moves + 1;
      if (acp == 1) {
        b.text = 'X';
        p1.add(b.id);
        acp = 2;
        b.enable = false;
        display = "O to Play!";
      } else {
        b.text = 'O';
        p2.add(b.id);
        acp = 1;
        b.enable = false;
        display = "X to Play!";
      }
      checkwinner();
    });
  }

  void checkwinner() {
    int winner = -1;
    if (p1.contains(1) && p1.contains(2) && p1.contains(3)) {
      winner = 1;
    }
    if (p1.contains(4) && p1.contains(5) && p1.contains(6)) {
      winner = 1;
    }
    if (p1.contains(7) && p1.contains(8) && p1.contains(9)) {
      winner = 1;
    }
    if (p1.contains(1) && p1.contains(4) && p1.contains(7)) {
      winner = 1;
    }
    if (p1.contains(2) && p1.contains(5) && p1.contains(8)) {
      winner = 1;
    }
    if (p1.contains(3) && p1.contains(6) && p1.contains(9)) {
      winner = 1;
    }
    if (p1.contains(1) && p1.contains(5) && p1.contains(9)) {
      winner = 1;
    }
    if (p1.contains(3) && p1.contains(5) && p1.contains(7)) {
      winner = 1;
    }
    //for player 2
    if (p2.contains(1) && p2.contains(2) && p2.contains(3)) {
      winner = 2;
    }
    if (p2.contains(4) && p2.contains(5) && p2.contains(6)) {
      winner = 2;
    }
    if (p2.contains(7) && p2.contains(8) && p2.contains(9)) {
      winner = 2;
    }
    if (p2.contains(1) && p2.contains(4) && p2.contains(7)) {
      winner = 2;
    }
    if (p2.contains(2) && p2.contains(5) && p2.contains(8)) {
      winner = 2;
    }
    if (p2.contains(3) && p2.contains(6) && p2.contains(9)) {
      winner = 2;
    }
    if (p2.contains(1) && p2.contains(5) && p2.contains(9)) {
      winner = 2;
    }
    if (p2.contains(3) && p2.contains(5) && p2.contains(7)) {
      winner = 2;
    }
    if (winner > 0) {
      if (winner == 1) {
        display = "Player 1 Wins!!!";
      } else {
        display = "Player 2 Wins!!!";
      }
      for (int i = 0; i < 9; i++) {
        gamebuttons[i].enable = false;
      }
    } else {
      if (moves == 9) {
        display = "Match Draw!";
      }
    }
  }

  void reset() {
    setState(() {
      gamebuttons = setgame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 36.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.black,
            height: 65.0,
            child: Center(
              child: Text(
                display,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, id) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text(
                        gamebuttons[id].text,
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                      onPressed: gamebuttons[id].enable
                          ? () => playgame(gamebuttons[id])
                          : null,
                      color: Colors.blueGrey,
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75.0,
                width: 350.0,
                child: RaisedButton(
                  onPressed: reset,
                  color: Colors.cyanAccent,
                  child: Text(
                    "Reset the Game",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 36.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
