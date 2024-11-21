import 'package:flutter/material.dart';

void main() {
  runApp(WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.camera_alt, size: 64, color: Colors.grey),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {"name": "John Doe", "message": "Hello!", "time": "10:00 AM"},
    {"name": "Jane Smith", "message": "How are you?", "time": "9:45 AM"},
    {"name": "Bob Brown", "message": "Let's meet up.", "time": "9:30 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(chats[index]["name"]!),
          subtitle: Text(chats[index]["message"]!),
          trailing: Text(chats[index]["time"]!),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Status Page", style: TextStyle(fontSize: 18)),
    );
  }
}

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Calls Page", style: TextStyle(fontSize: 18)),
    );
  }
}
