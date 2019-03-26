library(SuperGauss)


### Name: rSnorm
### Title: Simulation of a stationary Gaussian time series.
### Aliases: rSnorm

### ** Examples

N <- 10
acf <- exp(-(1:N - 1))
rSnorm(n = 3, acf = acf)



