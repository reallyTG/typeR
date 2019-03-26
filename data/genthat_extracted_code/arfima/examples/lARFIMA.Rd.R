library(arfima)


### Name: lARFIMA
### Title: Exact log-likelihood of a long memory model
### Aliases: lARFIMA
### Keywords: ts

### ** Examples


set.seed(3452)
sim <- arfima.sim(1000, model = list(phi = c(0.3, -0.1)))
lARFIMA(sim, phi = c(0.3, -0.1))




