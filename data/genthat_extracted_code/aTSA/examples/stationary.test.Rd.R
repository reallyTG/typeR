library(aTSA)


### Name: stationary.test
### Title: Stationary Test for Univariate Time Series
### Aliases: stationary.test

### ** Examples

x <- arima.sim(list(order = c(1,0,0),ar = 0.2),n = 100)
stationary.test(x)  # same as adf.test(x)
stationary.test(x, method = "pp") # same as pp.test(x)
stationary.test(x, method = "kpss") # same as kpss.test(x)



