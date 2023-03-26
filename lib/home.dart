import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Calender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Selected Day = ${today.toString().split(" ")[0]}",
              style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            TableCalendar(
              locale: "en_US",
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              selectedDayPredicate: (day) => isSameDay(day, today),
              rowHeight: 60,
              availableGestures: AvailableGestures.all,
              focusedDay: today,
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              onDaySelected: _onDaySelected,
            )
          ],
        ),
      ),
    );
  }
}
