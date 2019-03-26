library(nse)


### Name: nse.boot
### Title: Bootstrap estimator
### Aliases: nse.boot

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1

set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)

set.seed(1234)
nse.boot(x = x, nb = 1000, type = "stationary", b = NULL, lag.prewhite = 0)
nse.boot(x = x, nb = 1000, type = "circular", b = NULL, lag.prewhite = NULL)
nse.boot(x = x, nb = 1000, type = "circular", b = 10, lag.prewhite = NULL)



