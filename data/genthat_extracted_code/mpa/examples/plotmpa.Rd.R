library(mpa)


### Name: plotmpa
### Title: Network group's internal associations
### Aliases: plotmpa
### Keywords: multivariate

### ** Examples

data(revista)
mat <- matriz.mpa(revista, fmin=3, cmin=1)
clas <- mpa(mat$Matriza,10,mat$Palabras)
clas
plotmpa(1,mat$Matriza,clas)
plotmpa(6,mat$Matriza,clas)



