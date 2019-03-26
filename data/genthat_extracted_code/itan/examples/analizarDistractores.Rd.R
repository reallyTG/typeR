library(itan)


### Name: analizarDistractores
### Title: Análisis de distractores.
### Aliases: analizarDistractores

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select = -id )
analizarDistractores(respuestas, clave)




