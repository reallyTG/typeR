library(nse)


### Name: nse.hiruk
### Title: Hirukawa estimator
### Aliases: nse.hiruk

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1

set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)
nse.hiruk(x = x, type = "parzen", lag.prewhite = 0)
nse.hiruk(x = x, type = "bartlett", lag.prewhite = NULL)



