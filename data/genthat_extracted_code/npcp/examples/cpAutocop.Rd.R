library(npcp)


### Name: cpAutocop
### Title: Test for Change-Point Detection in Univariate Observations
###   Sensitive to Changes in the Autocopula
### Aliases: cpAutocop
### Keywords: htest nonparametric ts

### ** Examples

## AR1 example
n <- 200
k <- n/2 ## the true change-point
x <- matrix(c(arima.sim(list(ar = -0.5), n = k),
              arima.sim(list(ar = 0.5), n = n - k)))
cp <- cpAutocop(x)
cp
## Estimated change-point
which(cp$cvm == max(cp$cvm))

## AR2 example
n <- 200
k <- n/2 ## the true change-point
x <- matrix(c(arima.sim(list(ar = c(0,-0.5)), n = k),
              arima.sim(list(ar = c(0,0.5)), n = n - k)))
cpAutocop(x)
cpAutocop(x, lag = 2)
cpAutocop(x, lag = 2, bivariate = TRUE)



