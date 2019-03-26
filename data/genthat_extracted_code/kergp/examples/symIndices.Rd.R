library(kergp)


### Name: symIndices
### Title: Vector of Indices Useful for Symmetric or Anti-Symmetric
###   Matrices.
### Aliases: symIndices

### ** Examples

n <- rpois(1, lambda = 10)
L <- symIndices(n)
X <- matrix(1L:(n * n), nrow = n)
max(abs(X[lower.tri(X, diag = FALSE)] - L$kL))
max(abs(t(X)[lower.tri(X, diag = FALSE)] - L$kU))
cbind(row = L$i, col = L$j)



