library(Sofi)


### Encoding: UTF-8

### Name: Sofi-package
### Title: Interfaz interactiva con fines didácticos
### Aliases: Sofi-package Sofi
### Keywords: package Registros Procesos Estadisticas

### ** Examples

# Esta es una función que lanza diferentes interfaces.

# Ejercicios de distribución
if (interactive()) {
  Estadistica(1)
}

# Para ver Distribuciones de probabilidad
if (interactive()) {
  Estadistica(2)
}

# Menú de Sofi
if (interactive()) {
  Estadistica(3)
}

# Graficas de datos
if (interactive()) {
  Estadistica(4)
}

# Función para evaluar códigos de  defunción.
if (interactive()) {
  Defunciones()
}

# RANDU: el caso de los malos RNG
if (interactive()) {
  Estadistica7()
}

# Aquí vemos como usar la función DefCap, ejemplo general.
Capis<-c("P456","C682","M613","F629","X392")
DefCap(Capis)

data(DatPru)
DatCap
InfCap

# Cuando ya tenemos el tamaño de la muestra usamos la función así.
Etapa01(IDm=DatCap[,1], CausaD=DatCap[,2], n=InfCap$n)

#



