library(itan)


### Name: calcularPuntajes
### Title: Cálculo de puntajes.
### Aliases: calcularPuntajes

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select = -id )
puntajes <- calcularPuntajes(corregirItems(respuestas, clave))
cbind(respuestas, pje=puntajes)




