library(LSTS)


### Name: smooth.periodogram
### Title: Smoothing periodogram
### Aliases: smooth.periodogram
### Keywords: Fourier periodogram smooth timeseries

### ** Examples

## Require "rdatamarket"
library(rdatamarket)

malleco = dmlist("22tn")
mammothcreek = dmlist("22r7")

## Example 1: malleco
periodogram(malleco$Value)
aux = smooth.periodogram(malleco$Value, plot = FALSE, spar = .8)
lines(aux$smooth.periodogram ~ aux$lambda, lwd = 2, col = "orange")

## Example 2: mammothcreek$Value
periodogram(mammothcreek$Value)
aux = smooth.periodogram(mammothcreek$Value, plot = FALSE, spar = .4)
lines(aux$smooth.periodogram ~ aux$lambda, lwd = 2, col = "orange")

## Example 3: AR(1) simulated
ts.sim = arima.sim(n = 1000, model = list(order = c(1,0,0), ar = 0.7))
periodogram(ts.sim)
aux = smooth.periodogram(ts.sim, plot = FALSE, spar = .7)
lines(aux$smooth.periodogram ~ aux$lambda, lwd = 2, col = "orange")
lines(fdensity(ar = 0.7, lambda = aux$lambda)~aux$lambda, col = "red")




