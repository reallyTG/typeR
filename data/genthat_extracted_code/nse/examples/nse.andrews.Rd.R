library(nse)


### Name: nse.andrews
### Title: Andrews estimator
### Aliases: nse.andrews

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1

set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)

nse.andrews(x = x, type = "parzen", lag.prewhite = 0)
nse.andrews(x = x, type = "tukey", lag.prewhite = 1)
nse.andrews(x = x, type = "qs", lag.prewhite = NULL)



