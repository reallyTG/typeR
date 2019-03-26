library(irregulAR1)


### Name: chol_tridiag_upper
### Title: Upper Cholesky decomposition of a tridiagonal matrix.
### Aliases: chol_tridiag_upper

### ** Examples

library(Matrix)
times <- c(1, 4:5, 7)
rho <- 0.5
sigma <- 1
Q <- ar1_prec_irregular(times, rho, sigma)
chol_tridiag_upper(Q)



