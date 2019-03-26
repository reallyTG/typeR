library(itan)


### Name: analizarItems
### Title: Análisis de ítems.
### Aliases: analizarItems

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select = -id )
analizarItems(corregirItems(respuestas, clave))




