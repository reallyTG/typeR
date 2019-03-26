library(robcor)


### Name: robar
### Title: Robust Fit Autoregressive Models to Time Series
### Aliases: robar
### Keywords: robust ts

### ** Examples

n <- 100
set.seed(361)
eps <- as.ts(rnorm(n))
x <- arima.sim(list(ar=c(1,-0.9)), n, innov=eps) # basic signal
z <- as.ts(rbinom(n, 1, 0.1) * rnorm(n, sd=10))  # noise
y <- x + z
spec.ar(robar(y, order=2))



