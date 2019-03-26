library(pdSpecEst)


### Name: rARMA
### Title: Simulate vARMA(2,2) time series
### Aliases: rARMA

### ** Examples

## ARMA(1,1) process: Example 11.4.1 in (Brockwell and Davis, 1991)
freq <- seq(from = pi / 100, to = pi, length = 100)
Phi <- array(c(0.7, 0, 0, 0.6, rep(0, 4)), dim = c(2, 2, 2))
Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)
ts.sim <- rARMA(200, 2, Phi, Theta, Sigma, freq = freq)
ts.plot(ts.sim$X) # plot generated time series traces.




