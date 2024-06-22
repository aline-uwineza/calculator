import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String button) {
    switch (button) {
      case 'AC':
        _expression = '';
        _result = '';
        break;
      case '=':
        try {
          _result = _calculateExpression(_expression);
        } catch (e) {
          _result = 'Error';
        }
        break;
      default:
        _expression += button;
        break;
    }
    setState(() {});
  }

  String _calculateExpression(String expression) {
    // Implement your calculation logic here
    // For now, just return the expression as is
    return expression;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _expression,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _result,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  CalculatorButton(
                    'AC',
                    onPressed: () => _onButtonPressed('AC'),
                    color: Colors.grey[800],
                  ),
                  CalculatorButton(
                    '+/-',
                    onPressed: () => _onButtonPressed('+/-'),
                    color: Colors.grey[800],
                  ),
                  CalculatorButton(
                    '%',
                    onPressed: () => _onButtonPressed('%'),
                    color: Colors.grey[800],
                  ),
                  CalculatorButton(
                    '÷',
                    onPressed: () => _onButtonPressed('÷'),
                    color: Colors.orange,
                  ),
                  CalculatorButton(
                    '7',
                    onPressed: () => _onButtonPressed('7'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '8',
                    onPressed: () => _onButtonPressed('8'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '9',
                    onPressed: () => _onButtonPressed('9'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '×',
                    onPressed: () => _onButtonPressed('×'),
                    color: Colors.orange,
                  ),
                  CalculatorButton(
                    '4',
                    onPressed: () => _onButtonPressed('4'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '5',
                    onPressed: () => _onButtonPressed('5'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '6',
                    onPressed: () => _onButtonPressed('6'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '-',
                    onPressed: () => _onButtonPressed('-'),
                    color: Colors.orange,
                  ),
                  CalculatorButton(
                    '1',
                    onPressed: () => _onButtonPressed('1'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '2',
                    onPressed: () => _onButtonPressed('2'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '3',
                    onPressed: () => _onButtonPressed('3'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '+',
                    onPressed: () => _onButtonPressed('+'),
                    color: Colors.orange,
                  ),
                  CalculatorButton(
                    '0',
                    onPressed: () => _onButtonPressed('0'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '.',
                    onPressed: () => _onButtonPressed('.'),
                    color: Colors.grey[900],
                  ),
                  CalculatorButton(
                    '=',
                    onPressed: () => _onButtonPressed('='),
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  CalculatorButton(this.text, {required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color?? Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}