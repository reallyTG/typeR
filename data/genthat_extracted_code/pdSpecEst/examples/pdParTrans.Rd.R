library(pdSpecEst)


### Name: pdParTrans
### Title: Riemannian HPD parallel transport
### Aliases: pdParTrans

### ** Examples

## Transport the vector W to the tangent space at the identity
W <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
diag(W) <- rnorm(3)
W[lower.tri(W)] <- t(Conj(W))[lower.tri(W)]
p <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
P <- t(Conj(p)) %*% p

pdParTrans(P, Logm(P, diag(3)), W) ## whitening transport




