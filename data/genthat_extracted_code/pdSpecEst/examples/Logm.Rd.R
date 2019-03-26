library(pdSpecEst)


### Name: Logm
### Title: Riemannian HPD logarithmic map
### Aliases: Logm

### ** Examples

 ## Generate two random HPD matrices
 q <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 Q <- t(Conj(q)) %*% q
 p <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 P <- t(Conj(p)) %*% p
 ## Compute logarithmic map
 Logm(P, Q)




