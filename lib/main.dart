import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeDatePage(),
    );
  }
}

class TimeDatePage extends StatefulWidget {
  @override
  _TimeDatePageState createState() => _TimeDatePageState();
}

class _TimeDatePageState extends State<TimeDatePage> {
  DateTime _dateTime;
  TimeOfDay _timeOfDay;
  getDate() async
  {
    DateTime date= await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year-20),
        lastDate: DateTime(DateTime.now().year+2));
    setState(() {
      _dateTime=date;
    });
  }
  getTime() async
  {
    TimeOfDay time= await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _timeOfDay=time;
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Data and Time Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dateTime==null?Text("Choose a Date:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),):Text("Date: ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            RaisedButton(child: Text("Date Picker"),onPressed: (){getDate();}),
            SizedBox(height: 20),
            _timeOfDay==null?Text("Choose a time", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),):
            Text("Time now: ${_timeOfDay.hour}.${_timeOfDay.minute} ${_timeOfDay.period}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            RaisedButton(child: Text("Time Picker"),onPressed: (){getTime();}),
          ],
        ),
      ),
    ));





  }
}

