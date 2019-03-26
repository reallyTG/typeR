library(bssm)


### Name: poisson_series
### Title: Simulated Poisson time series data
### Aliases: poisson_series
### Keywords: datasets

### ** Examples

# The data is generated as follows:
set.seed(321)
slope <- cumsum(c(0, rnorm(99, sd = 0.01)))
y <- rpois(100, exp(cumsum(slope + c(0, rnorm(99, sd = 0.1)))))



