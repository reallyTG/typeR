library(pdSpecEst)


### Name: Mid
### Title: Geodesic midpoint between HPD matrices
### Aliases: Mid

### ** Examples

 ## Generate two random HPD matrices
 a <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 A <- t(Conj(a)) %*% a
 b <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 B <- t(Conj(b)) %*% b
 ## Compute midpoint
 Mid(A, B)
 ## Midpoint coincides with two-point intrinsic Karcher mean
 all.equal(pdMean(array(c(A, B), dim = c(3, 3, 2))), Mid(A, B))




