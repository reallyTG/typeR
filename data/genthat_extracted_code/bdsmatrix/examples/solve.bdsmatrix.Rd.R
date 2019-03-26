library(bdsmatrix)


### Name: solve.bdsmatrix
### Title: Solve a matrix equation using the generalized Cholesky
###   decompostion
### Aliases: solve.bdsmatrix
### Keywords: array

### ** Examples

tmat <- bdsmatrix(c(3,2,2,4), 
              c(22,1,2,21,3,20,19,4,18,17,5,16,15,6,7, 8,14,9,10,13,11,12),
              matrix(c(1,0,1,1,0,0,1,1,0,1,0,10,0,
                       0,1,1,0,1,1,0,1,1,0,1,0,10), ncol=2))
dim(tmat)
solve(tmat, cbind(1:13, rep(1,13)))



