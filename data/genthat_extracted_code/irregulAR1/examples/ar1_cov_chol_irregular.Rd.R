library(irregulAR1)


### Name: ar1_cov_chol_irregular
### Title: Upper triangular Cholesky decomposition for a stationary
###   Gaussian AR(1) process covariance matrix, observed at irregularly
###   spaced time points.
### Aliases: ar1_cov_chol_irregular

### ** Examples

times <- c(1, 4:5, 7)
rho <- 0.5
sigma <- 1
ar1_cov_chol_irregular(times, rho, sigma)



