library(SuperGauss)


### Name: Choleski
### Title: Choleski multiplication with Toeplitz variance matrices.
### Aliases: Choleski cholZX cholXZ

### ** Examples

N <- 10
p <- 2
W <- matrix(rnorm(N * p), N, p)
acf <- exp(-(1:N - 1))
cholZX(Z = W, acf = acf)
cholXZ(X = W, acf = acf)



