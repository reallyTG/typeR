library(arfima)


### Name: arfima.sim
### Title: Simulate an ARFIMA time series.
### Aliases: arfima.sim
### Keywords: fit ts

### ** Examples


set.seed(6533)
sim <- arfima.sim(1000, model = list(phi = .2, dfrac = .3, dint = 2))

fit <- arfima(sim, order = c(1, 2, 0))
fit




