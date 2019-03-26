library(irlba)


### Name: partial_eigen
### Title: Find a few approximate largest eigenvalues and corresponding
###   eigenvectors of a symmetric matrix.
### Aliases: partial_eigen

### ** Examples

set.seed(1)
# Construct a symmetric matrix with some positive and negative eigenvalues:
V <- qr.Q(qr(matrix(runif(100),nrow=10)))
x <- V %*% diag(c(10, -9, 8, -7, 6, -5, 4, -3, 2, -1)) %*% t(V)
partial_eigen(x, 3)$values

# Compare with eigen
eigen(x)$values[1:3]

# Use symmetric=FALSE to compute the eigenvalues of t(x) %*% x for general
# matrices x:
x <- matrix(rnorm(100), 10)
partial_eigen(x, 3, symmetric=FALSE)$values
eigen(crossprod(x))$values




