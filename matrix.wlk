object nave {
    var pasajeros = #{neo, trinity, morfeo}

    method pasajeros() = pasajeros

    method pasajeroMayorVitalidad(){
        return pasajeros.max({p => p.vitalidad()})
    }
   
    method vitalidadEnEquilibrio(){
        self.pasajeroMayorVitalidad().vitalidad() < pasajeros.forEach({p => p.vitalidad()}) * 2 
    }

    method elegidoEnNave(){
        pasajeros.any({p => p.esElElegido()})
    }

    method naveChoca(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method naveAcelera(){
        pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
    }
}





object neo {
var energia = 100
var vitalidad = energia / 10
const esElElegido = true

method esElElegido() = esElElegido
method vitalidad() = vitalidad
method energia() = energia

method saltar() {
    energia = energia / 2
}

}

object morfeo {
var vitalidad = 8
var estaDescansado = true
var esElElegido = false

method esElElegido() = esElElegido
method vitalidad() = vitalidad
method estaDescansado() = estaDescansado

method saltar(){
   estaDescansado = not estaDescansado 
   vitalidad = (vitalidad - 1).max(0)
}


}


object trinity {
var vitalidad = 0
const esElElegido = false

method vitalidad() = vitalidad
method saltar() {}
method esElElegido() = esElElegido

}