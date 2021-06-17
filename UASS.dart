import 'package:flutter/material.dart';

void main() => runApp(App04());

class App04 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Data": (context) => DilaDataTable(),
        "Lupa": (context) => LupaPass(),
        "aritmatika": (context) => ProgramMatematika(),
      },
      title: 'FORM LOGIN',
      home: Scaffold(
        appBar: AppBar(
          title: Text('UAS-Dila Maghfirah Hrp (6SIA4)'),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myNirm = TextEditingController();

  String nirm;

  onLogin() {
    nirm = myNirm.text;
    if (nirm == '2018020318') {
      Navigator.pushNamed(context, "Data");
    } else {
      Navigator.pushNamed(context, "Lupa");
    }
  }

  Widget build(BuildContext context) {
    final id = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: myNirm,
      decoration: InputDecoration(
        icon: Icon(Icons.person, color: Colors.blue),
        hintText: 'NIRM',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: onLogin,
          // () {Navigator.pushNamed(context, "myApp");},
          color: Colors.lightBlueAccent,
          child: Text('Masuk', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            id,
            SizedBox(height: 8.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}

class LupaPass extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lupa NIRM'),
        ),
        //body
        body: Text("Nirm Yang Anda Masukkan Salah"));
  }
}

class DindaDataTable extends StatefulWidget {
  _DindaDataTableState createState() =>
      _DindaDataTableState();
}

class _DindaDataTableState
    extends State<DindaDataTable> {
  List<DataMahasiswa> barang;

  void initState() {
    super.initState();
    barang = DataMahasiswa.getDataBarang();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dila Maghfirah Hrp - 6SIA4'),
      ),
      body: ListView(children: <Widget>[
        Center(
            child: Text('Data Mahasiswa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        DataTable(
          columns: [
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          rows: barang
              .map(
                (barang) => DataRow(cells: [
                  DataCell(Text(barang.id)),
                  DataCell(Text(barang.namabarang)),
                ]),
              )
              .toList(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.pushNamed(context, "aritmatika");
              },
              color: Colors.lightBlueAccent,
              child: Text('Program Matematika',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ]),
    );
  }
}

class DataMahasiswa {
  //Attribut
  String id;
  String namabarang;

  //Constructor
  DataMahasiswa({this.id, this.namabarang});

  //Data List
  static List<DataMahasiswa> getDataBarang() {
    return <DataMahasiswa>[
      DataMahasiswa(
        id: "Nama",
        namabarang: "Dila Maghfirah Hrp",
      ),
      DataMahasiswa(
        id: "Jenis Kelamin",
        namabarang: "Perempuan",
      ),
      DataMahasiswa(
        id: "Alamat",
        namabarang: "TANJUNG MORAWA",
      ),
      DataMahasiswa(
        id: "Jurusan",
        namabarang: "Sistem Informasi",
      ),
    ];
  }
}

class ProgramMatematika extends StatefulWidget {
  createState() => _ProgramMatematikaInputDataState();
}

class _ProgramMatematikaInputDataState extends State<ProgramMatematika> {

  final _Nama = TextEditingController();
  final _Jumlah = TextEditingController();
  final _Harga = TextEditingController();
  String _totalbayar='';

 

  onHitung() {
    setState(() {
      var hitung= int.parse(_Jumlah.text)* int.parse( _Harga .text);
      _totalbayar =
         "Total Pembayaran = $hitung";
    });
  }
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Program Matematika"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
         decoration: InputDecoration(labelText: "Nama Barang"),
            ),
             TextField(
              controller: _Jumlah,
              decoration: InputDecoration(labelText: "Jumlah Barang"),
            ),
            TextField(
              controller: _Harga,
              decoration: InputDecoration(labelText: "Harga Barang"),
            ),
            RaisedButton(
              child: Text("Hitung"),
              onPressed: onHitung,
            ),
            Text("$_totalbayar"),
          ],
        ),
      ),
    );
  }
}
 class Gagal extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            " GAGAL LOGIN ",
          ),
        ),
        body: Center(child: Text("ANDA GAGAL LOGIN !!!!", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))));
  }
}