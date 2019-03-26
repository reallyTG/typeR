library(matlib)


### Name: Eigen
### Title: Eigen Decomposition of a Square Symmetric Matrix
### Aliases: Eigen

### ** Examples

C <- matrix(c(1,2,3,2,5,6,3,6,10), 3, 3) # nonsingular, symmetric
C
EC <- Eigen(C) # eigenanalysis of C
EC$vectors %*% diag(EC$values) %*% t(EC$vectors) # check



