library(mixAK)


### Name: MatMPpinv
### Title: Moore-Penrose pseudoinverse of a squared matrix
### Aliases: MatMPpinv C_MPpinvSP
### Keywords: array algebra

### ** Examples

set.seed(770328)
A <- rWISHART(1, 5, diag(4))
Ainv <- MatMPpinv(A)

### Check the conditions
prec <- 13
round(A - A %*% Ainv %*% A, prec)
round(Ainv - Ainv %*% A %*% Ainv, prec)
round(A %*% Ainv - t(A %*% Ainv), prec)
round(Ainv %*% A - t(Ainv %*% A), prec)



