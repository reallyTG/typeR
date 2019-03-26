library(Sofi)


### Encoding: UTF-8

### Name: Etapa01
### Title: Crea la Muestra
### Aliases: Etapa01
### Keywords: Registros

### ** Examples

##Aquí vemos como usar la función Etapa01

data(DatPru)
DatCap
InfCap

##Cuando ya tenemos el tamaño de la muestra usamos la función así
Etapa01(IDm=DatCap[,1], CausaD=DatCap[,2], n=InfCap$n)

##Si solo se tiene el vector con la proporción esperada 
##(o antecedentes), los valores de “Es” se predeterminan en 0.03
Etapa01(IDm=DatCap[,1], CausaD=DatCap[,2], ps=InfCap$ps)



