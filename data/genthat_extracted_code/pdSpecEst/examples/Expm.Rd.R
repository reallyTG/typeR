library(pdSpecEst)


### Name: Expm
### Title: Riemannian HPD exponential map
### Aliases: Expm

### ** Examples

 ## Generate random Hermitian matrix
 H <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 diag(H) <- rnorm(3)
 H[lower.tri(H)] <- t(Conj(H))[lower.tri(H)]
 ## Generate random HPD matrix
 p <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
 P <- t(Conj(p)) %*% p
 ## Compute exponential map
 Expm(P, H)




