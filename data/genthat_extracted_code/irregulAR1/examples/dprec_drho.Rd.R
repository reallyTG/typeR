library(irregulAR1)


### Name: dprec_drho
### Title: Derivative of the precision matrix for a stationary Gaussian
###   AR(1) process.
### Aliases: dprec_drho

### ** Examples

library(Matrix)
times <- c(1, 4:5, 7)
rho <- 0.5
sigma <- 1
dprec_drho(times, rho, sigma)



