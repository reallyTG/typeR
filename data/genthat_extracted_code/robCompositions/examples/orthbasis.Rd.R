library(robCompositions)


### Name: orthbasis
### Title: Orthonormal basis
### Aliases: orthbasis
### Keywords: manip

### ** Examples


data(expenditures)
V <- orthbasis(ncol(expenditures))
xcen <- cenLR(expenditures)$x.clr
xi <- as.matrix(xcen) %*% V$V
xi
xi2 <- pivotCoord(expenditures)
xi2



