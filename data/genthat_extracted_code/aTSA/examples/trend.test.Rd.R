library(aTSA)


### Name: trend.test
### Title: Trend Test
### Aliases: trend.test

### ** Examples

x <- rnorm(100)
trend.test(x,plot = TRUE) # no trend

x <- 5*(1:100)/100
x <- x + arima.sim(list(order = c(1,0,0),ar = 0.4),n = 100)
trend.test(x,plot = TRUE) # increasing trend



