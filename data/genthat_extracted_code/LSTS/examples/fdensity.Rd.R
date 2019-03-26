library(LSTS)


### Name: fdensity
### Title: Spectral density
### Aliases: fdensity spectral
### Keywords: density spectral timeseries

### ** Examples

## Example 1: Spectral Density AR(1)
lambda = seq(0,pi,0.01)
f = fdensity(ar = 0.5, lambda = lambda)
plot(f~lambda, bty = "n", type = "l", las = 1, xlab = expression("Frequency"),
     ylab = expression("Spectral Density"))


## Example 2: Spectral Density AR(2)
lambda = seq(0,pi,0.01)
f = fdensity(ar = c(1.3,-0.6), lambda = lambda, sd=10)
plot(f~lambda, bty = "n", type = "l", las = 1, xlab = expression("Frequency"),
     ylab = expression("Spectral Density"))


## Spectral Density ARMA(1,1)
lambda = seq(0,pi,0.01)
f = fdensity(ar = 0.5, ma = 0.8, lambda = lambda)
plot(f~lambda, bty = "n", type = "l", las = 1, xlab = expression("Frequency"),
     ylab = expression("Spectral Density"))


## Spectral Density ARFIMA(1,d,1)
lambda = seq(0,pi,0.01)
f = fdensity(ar = 0.5, ma = 0.8, d = 0.2, lambda = lambda)
plot(f~lambda, bty = "n", type = "l", las = 1, xlab = expression("Frequency"),
     ylab = expression("Spectral Density"))



