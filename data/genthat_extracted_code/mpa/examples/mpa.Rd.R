library(mpa)


### Name: mpa
### Title: CoWords method
### Aliases: mpa contar.si reemplazar.si
### Keywords: multivariate

### ** Examples

#revista <- leer.mpa("revista.txt",encoding="latin1")
data(revista)
mat <- matriz.mpa(revista, fmin=3, cmin=1)
clas <- mpa(mat$Matriza,10,mat$Palabras)
clas



