library(nse)


### Name: nse.spec0
### Title: Spectral density at zero estimator
### Aliases: nse.spec0

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1
set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)

nse.spec0(x = x, type = "parzen", lag.prewhite = 0, welch = TRUE, steep = TRUE)



