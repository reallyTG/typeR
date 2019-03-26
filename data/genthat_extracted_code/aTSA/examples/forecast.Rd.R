library(aTSA)


### Name: forecast
### Title: Forecast From ARIMA Fits
### Aliases: forecast

### ** Examples

x <- arima.sim(list(order = c(3,0,0),ar = c(0.2,0.4,-0.15)),n = 100)
fit <- estimate(x,p = 3) # same as fit <- arima(x,order = c(3,0,0))
forecast(fit,lead = 4)

# forecast with id
t <- as.Date("2014-03-25") + 1:100
forecast(fit,lead = 4, id = t)



