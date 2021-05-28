import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int firstnum = 0;
int secondnum = 0;
String texttodisplay = "";
String res = "";
String operatetoperform = "";
void btnclicked(String btnval){
  if(btnval == "C"){
    texttodisplay= "";
    firstnum=0;
    secondnum=0;
    res="";
  }
  else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
    firstnum = int.parse(texttodisplay);
    res = "";
    operatetoperform = btnval;
  }
  else if(btnval == "="){
    secondnum = int.parse(texttodisplay);
    if(operatetoperform == "+"){
      res = (firstnum + secondnum).toString();
    }
    if(operatetoperform == "-"){
      res = (firstnum - secondnum).toString();
    }
    if(operatetoperform == "x"){
      res = (firstnum * secondnum).toString();
    }
    if(operatetoperform == "/"){
      res = (firstnum / secondnum).toString();
    }
  }
  else{
    res = int.parse(texttodisplay + btnval).toString();

  }

  setState(() {
    texttodisplay = res;
  });
}

  Widget custombutton(String btnval) {
    return Expanded(
        child: RaisedButton(
          color: Colors.black26,
          padding: EdgeInsets.all(25.0),
          shape: CircleBorder(),
      onPressed: () => btnclicked(btnval),
      child: Text("$btnval", 
      style: TextStyle(color: Colors.white,
        fontSize: 25.0),
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: 90,
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(30), 
          border: Border.all(color: Colors.black38,width: 6)),
          
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10.0), 
            
            child: Text(
              "$texttodisplay", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),

          ) ,

SizedBox(height: 10.0),
          Row(
            children: [
              custombutton("7"),
              custombutton("8"),
              custombutton("9"),
              custombutton("C"),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              custombutton("4"),
              custombutton("5"),
              custombutton("6"),
              custombutton("-"),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              custombutton("1"),
              custombutton("2"),
              custombutton("3"),
              custombutton("x"),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              custombutton("0"),
              custombutton("="),
              custombutton("+"),
              custombutton("/"),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      )),
    );
  }
}
