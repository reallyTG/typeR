library(irregulAR1)


### Name: ar1_lpdf
### Title: Evaluate the log-density of a stationary Gaussian AR(1) process.
### Aliases: ar1_lpdf

### ** Examples

x <- rnorm(5) + 1:5
t <- c(1, 3, 5:6, 10)
rho <- 0.5
sigma <- 1
# zero mean
ar1_lpdf(x, t, rho, sigma)
# means equal times
mu <- t
ar1_lpdf(x + mu, t, rho, sigma, mu)



