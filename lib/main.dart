import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CAlculator(),
    );
  }
}

class CAlculator extends StatefulWidget {
  const CAlculator({Key? key}) : super(key: key);

  @override
  State<CAlculator> createState() => _CAlculatorState();
}

class _CAlculatorState extends State<CAlculator> {
  String result = "0";
  String finalRes = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String ops = ("");

  buttonpressed(String butVal) {
    if (butVal == "Ac") {
      finalRes = "0";
      num1 = 0.0;
      num2 = 0.0;
      ops = ("");
    } else if (butVal == "+" ||
        butVal == "-" ||
        butVal == "x" ||
        butVal == "/") {
      num1 = double.parse(result);
      ops = butVal;
      finalRes = "0";
      result = result + butVal;
    } else if (butVal == ".") {
      if (finalRes.contains(".")) {
      } else {
        finalRes = finalRes + butVal;
      }
    } else if (butVal == "%") {
      num2 = double.parse(result);
      finalRes = (num2 / 100).toString();
    } else if (butVal == "+/-") {
      if (result.toString().contains("-")) {
        result.toString().substring(1);
        finalRes = result;
      } else {
        result = "-" + result;
        finalRes = result;
      }
    } else if (butVal == "=") {
      num2 = double.parse(result);
      if (ops == "+") {
        finalRes = (num1 + num2).toString();
      } else if (ops == "-") {
        finalRes = (num1 - num2).toString();
      }
      if (ops == "x") {
        finalRes = (num1 * num2).toString();
      }
      if (ops == "/") {
        finalRes = (num1 / num2).toString();
      }
    } else {
      finalRes = finalRes + butVal;
    }

    setState(() {
      result = double.parse(finalRes).toString();
    });
  }

  Widget buttonForm(String buttontext, Color textColor, Color bacolor) {
    if (buttontext != "0") {
      return RawMaterialButton(
        padding: const EdgeInsets.all(10),
        onPressed: () {
          buttonpressed(buttontext);
        },
        shape: const CircleBorder(),
        fillColor: bacolor,
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: 35,
            color: textColor,
          ),
        ),
      );
    } else {
      return RawMaterialButton(
        padding: const EdgeInsets.fromLTRB(
          34,
          20,
          100,
          20,
        ),
        onPressed: () {
          buttonpressed(buttontext);
        },
        shape: const StadiumBorder(),
        fillColor: bacolor,
        child: Text(
          buttontext,
          style: TextStyle(
            fontSize: 35,
            color: textColor,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 100,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "calculator",
          style: TextStyle(color: Colors.amber[100]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  finalRes,
                  textAlign: TextAlign.left,
                  style: textStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("Ac", Colors.white, Colors.blue),
                buttonForm("+/-", Colors.white, Colors.blue),
                buttonForm("%", Colors.white, Colors.blue),
                buttonForm("/", Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("7", Colors.white, Colors.blue),
                buttonForm("8", Colors.white, Colors.blue),
                buttonForm("9", Colors.white, Colors.blue),
                buttonForm("x", Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("4", Colors.white, Colors.blue),
                buttonForm("5", Colors.white, Colors.blue),
                buttonForm("6", Colors.white, Colors.blue),
                buttonForm("-", Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("1", Colors.white, Colors.blue),
                buttonForm("2", Colors.white, Colors.blue),
                buttonForm("3", Colors.white, Colors.blue),
                buttonForm("+", Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("0", Colors.white, Colors.blue),
                buttonForm(".", Colors.white, Colors.blue),
                buttonForm("=", Colors.white, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
