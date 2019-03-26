library(orloca.es)


### Name: distsummin
### Title: distsummin en el paquete orloca
### Aliases: distsummin distsummin,loca.p-method

### ** Examples

# Un objeto loca.p sin pesos
loca <- new("loca.p", x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Calcula el minimo
sol <- distsummin(loca)

# Muestra el resultado
sol

# Evaluacion de la funcion objetivo en el punto solucion
distsum(loca, sol[1], sol[2])



