import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador SENAI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SorteadorPage(),
    );
  }
}

class SorteadorPage extends StatefulWidget {
  const SorteadorPage({super.key});

  @override
  State<SorteadorPage> createState() => _SorteadorPageState();
}

class _SorteadorPageState extends State<SorteadorPage> {
  // Variável de estado para armazenar o número sorteado
  int numeroSorteado = 0;
  
  // Instância do Random para gerar números aleatórios
  final Random random = Random();

  // Método para sortear um novo número
  void sortearNumero() {
    setState(() {
      // Gera um número aleatório entre 0 e 99, depois soma 1 para ficar entre 1 e 100
      numeroSorteado = random.nextInt(100) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sorteador SENAI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Número sorteado em destaque
            Text(
              numeroSorteado == 0 ? '?' : numeroSorteado.toString(),
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            // Espaçamento entre o número e o botão
            const SizedBox(height: 40),
            
            // Botão "Tentar a Sorte"
            ElevatedButton(
              onPressed: sortearNumero,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Tentar a Sorte'),
            ),
          ],
        ),
      ),
    );
  }
}