
void main() {
  Producto p1= Producto("Cocacola", 100.0, DateTime.now().add(Duration(days: 10)));
  Producto p2=Producto("Pessi", 50.0, DateTime.now().add(Duration(days: 15)));
  Producto p3=Producto("Postobon", 200.0, DateTime.now().add(Duration(days: 16)));
  Producto P4=Producto("Cuatro", 150.0, DateTime.now().add(Duration(days: 20)));

  Venta venta = Venta();
  venta.agregarp(p1);
  venta.agregarp(p2);
  venta.agregarp(p3);
  venta.agregarp(P4);

  double total= venta.calculartl();

  print("producto en venta");
  for(var producto in venta.productos){
    print("${producto.nombre}:\ ${producto.precio}");
  }
  print("Total del pago:\$${total.toStringAsFixed(2)}");
  
  // Me falto pedir por consola que escogiera los productos 

}



class Producto{
  String nombre;
  double precio;
  DateTime fechav;
  Producto(this.nombre,this.precio,this.fechav);
}

class Venta {
  List<Producto> productos = [];
  void agregarp (Producto producto){
    productos.add(producto);
  }

  double calculartl (){
    double total = 0 ;
    for(var producto in productos ){
      // ignore: unnecessary_null_comparison
      if(producto.fechav != null){
        DateTime fechaActual = DateTime.now();
        int diashastavencimiento= producto.fechav.difference(fechaActual).inDays;
        if(diashastavencimiento<=15){
          total+=producto.precio *0.85;
        }else{
          total+=producto.precio;
        }
      }else{
        total+=producto.precio;
      }
    }return total;

  }
}

