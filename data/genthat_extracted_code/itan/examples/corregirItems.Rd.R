library(itan)


### Name: corregirItems
### Title: Correción de ítems.
### Aliases: corregirItems

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select = -id )
corregirItems(respuestas, clave)




