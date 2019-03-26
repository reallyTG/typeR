library(pdSpecEst)


### Name: H.coeff
### Title: Orthonormal basis expansion of a Hermitian matrix
### Aliases: H.coeff

### ** Examples

## random Hermitian matrix
H <- matrix(complex(real = rnorm(9), imaginary = rnorm(9)), nrow = 3)
diag(H) <- rnorm(3)
H[lower.tri(H)] <- t(Conj(H))[lower.tri(H)]

## orthonormal basis expansion
h <- H.coeff(H)
H1 <- H.coeff(h, inverse = TRUE) ## reconstructed Hermitian matrix
all.equal(H, H1)




