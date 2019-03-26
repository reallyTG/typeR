library(irregulAR1)


### Name: ar1_sim_irregular
### Title: Simulate from a stationary Gaussian AR(1) process at irregular
###   times.
### Aliases: ar1_sim_irregular

### ** Examples

times <- c(3, 5:7, 10)
rho <- 0.5
sigma <- 1
mu <- seq_along(times)
ar1_sim_irregular(times, rho, sigma)
ar1_sim_irregular(times, rho, sigma, mu)



