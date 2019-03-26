library(irregulAR1)


### Name: ar1_prec_chol_irregular
### Title: Upper Cholesky triangle of the precision matrix of a stationary
###   Gaussian AR(1) process, observed at irregularly spaced time points.
### Aliases: ar1_prec_chol_irregular

### ** Examples

library(Matrix)
times <- c(1, 4:5, 7)
rho <- 0.5
sigma <- 1
ar1_prec_chol_irregular(times, rho, sigma)



