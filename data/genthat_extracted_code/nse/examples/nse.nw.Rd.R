library(nse)


### Name: nse.nw
### Title: Newey-West estimator
### Aliases: nse.nw

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1

set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)

nse.nw(x = x, lag.prewhite = 0)
nse.nw(x = x, lag.prewhite = 1)
nse.nw(x = x, lag.prewhite = NULL)



