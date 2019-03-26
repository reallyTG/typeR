library(cmna)


### Name: choleskymatrix
### Title: Cholesky Decomposition
### Aliases: choleskymatrix

### ** Examples

(A <- matrix(c(5, 1, 2, 1, 9, 3, 2, 3, 7), 3))
(L <- choleskymatrix(A))
t(L) %*% L




