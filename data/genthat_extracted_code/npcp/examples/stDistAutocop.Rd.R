library(npcp)


### Name: stDistAutocop
### Title: Combined Test of Stationarity for Univariate Continuous Time
###   Series Sensitive to Changes in the Distribution Function and the
###   Autocopula
### Aliases: stDistAutocop
### Keywords: htest nonparametric ts

### ** Examples

## AR1 example
n <- 200
k <- n/2 ## the true change-point
x <- matrix(c(arima.sim(list(ar = -0.1), n = k),
              arima.sim(list(ar = 0.5), n = n - k)))
stDistAutocop(x)

## AR2 example
n <- 200
k <- n/2 ## the true change-point
x <- matrix(c(arima.sim(list(ar = c(0,-0.1)), n = k),
              arima.sim(list(ar = c(0,0.5)), n = n - k)))
## Not run: 
##D stDistAutocop(x)
##D stDistAutocop(x, lag = 2)
## End(Not run)
stDistAutocop(x, lag = 2, pairwise = TRUE)



