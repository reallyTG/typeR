library(fpc)


### Name: bhattacharyya.matrix
### Title: Matrix of pairwise Bhattacharyya distances
### Aliases: bhattacharyya.matrix
### Keywords: cluster multivariate

### ** Examples

  muarray <- cbind(c(0,0),c(0,0.1),c(10,10))
  sigmaarray <- array(c(diag(2),diag(2),diag(2)),dim=c(2,2,3))
  bhattacharyya.matrix(muarray,sigmaarray,ipairs=list(c(1,2),c(2,3)))




