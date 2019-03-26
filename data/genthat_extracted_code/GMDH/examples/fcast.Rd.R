library(GMDH)


### Name: fcast
### Title: A Function to Make Short Term Forecasting via GMDH-Type Neural
###   Network Algorithms
### Aliases: fcast
### Keywords: functions

### ** Examples

data = ts(rnorm(100, 10, 1))
out = fcast(data)
out

data = ts(rnorm(100, 10, 1))
out = fcast(data, input = 6, layer = 2, f.number = 1)
out$mean
out$fitted
out$residuals
plot(out$residuals)
hist(out$residuals)




