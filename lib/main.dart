import 'package:flutter/material.dart';

void main() => runApp(const AppAmazon());

class AppAmazon extends StatelessWidget {
  const AppAmazon({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Losproductos(),
    );
  }
}

// 🔹 CAMBIAMOS A StatefulWidget
class Losproductos extends StatefulWidget {
  const Losproductos({super.key});

  @override
  State<Losproductos> createState() => _LosproductosState();
}

class _LosproductosState extends State<Losproductos> {

  // Lista editable de nombres
  List<String> nombres = [
    "Laptop Gamer",
    "Audífonos Bluetooth",
    "Smartwatch Pro",
    "Mouse RGB"
  ];

  final List<String> imageUrls = [
    'https://raw.githubusercontent.com/fany0588/imagenes-para-flutter-6toI-fecha-11-feb-2026/refs/heads/main/usuario8.jpg',
    'https://raw.githubusercontent.com/fany0588/imagenes-para-flutter-6toI-fecha-11-feb-2026/refs/heads/main/usuario2.jpg',
    'https://raw.githubusercontent.com/fany0588/imagenes-para-flutter-6toI-fecha-11-feb-2026/refs/heads/main/usuario6.jpg',
    'https://raw.githubusercontent.com/fany0588/imagenes-para-flutter-6toI-fecha-11-feb-2026/refs/heads/main/usuario5.jpg',
  ];

  void editarNombre(int index) {
    TextEditingController controller =
        TextEditingController(text: nombres[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar nombre"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Nuevo nombre del producto",
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () {
                setState(() {
                  nombres[index] = controller.text;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Amazon Estefania',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 75, 122),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: nombres.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF131921),
            elevation: 8,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () => editarNombre(index), // 👈 TOCAR PARA EDITAR
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrls[index]),
              ),
              title: Text(
                nombres[index], // 👈 AHORA USA LA LISTA
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Disponible en inventario',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(
                Icons.edit, // Cambié a ícono editar
                color: Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
