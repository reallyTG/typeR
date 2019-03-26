library(mpa)


### Name: diagram.mpa
### Title: Strategic diagram
### Aliases: diagram.mpa
### Keywords: multivariate

### ** Examples

data(revista)
mat <- matriz.mpa(revista, fmin=3, cmin=1)
clas <- mpa(mat$Matriza,10,mat$Palabras)
diagram.mpa(clas,tmin=3)



