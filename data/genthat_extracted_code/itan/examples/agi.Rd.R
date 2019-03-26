library(itan)


### Name: agi
### Title: Análisis gráfico de ítems.
### Aliases: agi

### ** Examples

data(datos)
data(clave)
respuestas <- subset(datos, select=-id)
plots <- agi(respuestas, clave, nGrupos=ncol(respuestas)/2)
plots[[1]][[1]]
plots[[2]][[1]]




