import 'package:flutter/material.dart';

import 'persegi_result.dart';
import 'about_me.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(), 
    routes: <String, WidgetBuilder>{
     '/Halsatu' : (BuildContext context) => new Home(),
      '/Haldua' : (BuildContext context) => new MyProfil(),

    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  int panjang = 0;
  int lebar = 0;
  String jenis = "";

  void _pilihJenisHitung(String value) {
    setState(() {
      jenis = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.view_list),
        title: new Text('Menghitung Luas & Keliling PP'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: (){
                Navigator.pushNamed(context, '/Haldua');
              },
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
            
                new Padding(padding: new EdgeInsets.only(top: 20.0)),

                new Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            panjang = int.parse(txt);
                          });
                        },

                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                            labelText: "Panjang Persegi Panjang",
                            suffix: Text('cm'),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                            ),
                            hintText: 'Panjang'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(

                        onChanged: (txt) {
                          setState(() {
                            lebar = int.parse(txt);
                          });
                        },

                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                            labelText: "Lebar Persegi Panjang",
                            suffix: Text('cm'),
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                            ),
                            hintText: 'Lebar'),

                      ),
                    ),
                  ],
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Text("Pilih Jenis Perhitungan"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: "Luas",
                      groupValue: jenis,
                      onChanged: (String value) {
                        _pilihJenisHitung(value);
                      },
                    ),
                    Text(
                      'Luas',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: "Keliling",
                      groupValue: jenis,
                      onChanged: (String value) {
                        _pilihJenisHitung(value);
                      },
                    ),
                    Text(
                      'Keliling',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                  child: RaisedButton(
                    onPressed: () {
                      var route = new MaterialPageRoute(
                          builder: (BuildContext) =>
                          new PersegiResult(panjang_persegi: panjang, lebar_persegi: lebar,jenisHitung: jenis,),
                      );
                      Navigator.of(context).push(route);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      'Hitung',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}