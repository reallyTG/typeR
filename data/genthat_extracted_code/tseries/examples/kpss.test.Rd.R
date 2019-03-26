library(tseries)


### Name: kpss.test
### Title: KPSS Test for Stationarity
### Aliases: kpss.test
### Keywords: ts

### ** Examples

x <- rnorm(1000)  # is level stationary
kpss.test(x)

y <- cumsum(x)  # has unit root
kpss.test(y)

x <- 0.3*(1:1000)+rnorm(1000)  # is trend stationary
kpss.test(x, null = "Trend")



