// Velocímetro

/* Playground que contiene los elementos para representar un velocímetro de un automóvil.  */

import UIKit


/*

Declara la enumeración: Velocidades, sus valores serán de tipo Int. La enumeración Velocidades cuenta con los siguientes elementos y sus respectivos valores:

- Apagado = 0, representa la velocidad 0.
- VelocidadBaja = 20, representa una velocidad de 20km por hora.
- VelocidadMedia = 50, representa una velocidad de 50km por hora
- VelocidadAlta = 120, representa una velocidad de 50km por hora.
- Además, debes de declarar un inicializador que recibe un velocidad: init( velocidadInicial : Velocidades )
- El inicializador se debe asignar a self el valor de velocidadInicial

*/

enum Velocidades : Int {
    
    case Apagado = 0,
    VelocidadBaja = 20,
    VelocidadMedia = 50,
    VelocidadAlta = 120
    
    init(velocidadInicial : Velocidades){
        self = velocidadInicial
    }
    
}


/*

Declara la clase: Auto

La clase Auto tiene los siguientes atributos:

- Una variable que sea una instancia de la enumeración Velocidades, llamada: velocidad.

Las funciones o métodos que define la clase Auto son las siguientes:

- init( ), agrega la función inicializadora que crea una instancia de Velocidades: velocidad, debe iniciar en Apagado. Recuerda que la enumeración tiene su función inicializadora.
- func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String), la función cambioDeVelocidad, cambia el valor de velocidad a la siguiente velocidad gradual, por ejemplo:  Apagado cambia a VelocidadBaja, de VelocidadBaja cambia a VelocidadMedia, es decir cada ejecución cambia a la siguiente velocidad.. si llega a VelocidadAlta cambia a VelocidadMedia. Finalmente, la función debe regresar una tupla con la velocidad actual y una cadena con la leyenda de la velocidad correspondiente.

*/

class Auto{
    
    var velocidad : Velocidades = Velocidades(velocidadInicial: Velocidades.Apagado)
    
    init(velocidad : Velocidades){
        self.velocidad = velocidad
    }
    
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena : String){
        
        var actual : Int
        var velocidadEnCadena : String

        actual = velocidad.rawValue
        velocidadEnCadena = String(velocidad)
        
        if (velocidad == Velocidades.Apagado){
            velocidad = Velocidades.VelocidadBaja
        } else if (velocidad == Velocidades.VelocidadBaja){
            velocidad = Velocidades.VelocidadMedia
        } else if (velocidad == Velocidades.VelocidadMedia){
            velocidad = Velocidades.VelocidadAlta
        } else if (velocidad == Velocidades.VelocidadAlta){
            velocidad = Velocidades.VelocidadMedia
        } else {
            velocidad = Velocidades.Apagado
        }
        
        return (actual, velocidadEnCadena)
        
    }
    
}


/* 

Pruebas de la clase:

- En el mismo playground prueba crea una instancia de la clase Auto, llamada auto.
- Itera 20 veces usando un for, llama a la funcion cambioDeVelocidad e imprime los valores de la tupla en la consola.

*/

var auto = Auto(velocidad: Velocidades.Apagado)
var vel : (Int, String)

for i in 0..<20 {
    vel = auto.cambioDeVelocidad()
    print(vel)
}
