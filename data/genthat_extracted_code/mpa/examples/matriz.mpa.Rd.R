library(mpa)


### Name: matriz.mpa
### Title: Calculation of co-occurrences matrix and matrix associations
### Aliases: matriz.mpa
### Keywords: multivariate

### ** Examples

data(revista)
mat <- matriz.mpa(revista, fmin=3, cmin=1)
mat$Matriza
mat$Matrizc
diag(mat$Matrizc)



