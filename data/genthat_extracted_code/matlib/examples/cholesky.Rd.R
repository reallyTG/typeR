library(matlib)


### Name: cholesky
### Title: Cholesky Square Root of a Matrix
### Aliases: cholesky

### ** Examples

C <- matrix(c(1,2,3,2,5,6,3,6,10), 3, 3) # nonsingular, symmetric
C
cholesky(C)
cholesky(C) %*% t(cholesky(C))  # check




