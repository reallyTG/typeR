library(itan)


### Name: calcularNotas
### Title: Cálculo de notas.
### Aliases: calcularNotas

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select = -id)
puntajes <- calcularPuntajes(corregirItems(respuestas, clave))
notas <- calcularNotas(puntajes)
cbind(datos$id, pje=puntajes, nota=notas)




