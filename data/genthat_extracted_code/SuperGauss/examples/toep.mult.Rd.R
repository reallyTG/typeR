library(SuperGauss)


### Name: toep.mult
### Title: Toeplitz matrix multiplication.
### Aliases: toep.mult

### ** Examples

N <- 20
d <- 3
acf <- exp(-(1:N))
X <- matrix(rnorm(N*d), N, d)
toep.mult(acf, X)



