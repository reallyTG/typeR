library(analytics)


### Name: weakly.stationary
### Title: Testing for Weak Stationarity in a Time Series
### Aliases: weakly.stationary

### ** Examples

x1 <- rnorm(1e3)
weakly.stationary(tseries = x1)
weakly.stationary(tseries = x1, signific_gen = 0.025)
weakly.stationary(tseries = x1, signific_pp.df = 0.1)
weakly.stationary(tseries = x1, MK = TRUE)
weakly.stationary(tseries = x1, PSR = FALSE)
weakly.stationary(tseries = x1, weak.dep = TRUE)
weakly.stationary(tseries = x1, MK = TRUE, PSR = FALSE)
weakly.stationary(tseries = x1, mode = "strict")
weakly.stationary(tseries = x1, mode = "loose")

require(stats)
set.seed(123)
x2 <- arima.sim(n = 1e3, list(ar = 0.4))
weakly.stationary(tseries = x2)
weakly.stationary(tseries = x2, signific_gen = 0.01)
weakly.stationary(tseries = x2, MK = TRUE)
weakly.stationary(tseries = x2, PSR = FALSE)
weakly.stationary(tseries = x2, weak.dep = TRUE)
weakly.stationary(tseries = x2, MK = TRUE, PSR = FALSE)
weakly.stationary(tseries = x2, mode = "strict")
weakly.stationary(tseries = x2, mode = "loose")




