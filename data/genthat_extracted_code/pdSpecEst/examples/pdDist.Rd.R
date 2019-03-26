library(pdSpecEst)


### Name: pdDist
### Title: Compute distance between two HPD matrices
### Aliases: pdDist

### ** Examples

 a <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 A <- t(Conj(a)) %*% a
 b <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 B <- t(Conj(b)) %*% b
 pdDist(A, B) ## Riemannian distance




