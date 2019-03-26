library(midasr)


### Name: forecast.midas_r
### Title: Forecast MIDAS regression
### Aliases: forecast forecast.midas_r

### ** Examples

data("USrealgdp")
data("USunempr")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr), start = 1949)
trend <- 1:length(y)

##24 high frequency lags of x included
mr <- midas_r(y ~ trend + fmls(x, 23, 12, nealmon), start = list(x = rep(0, 3)))

##Forecast horizon
h <- 3
##Declining unemployment
xn <- rep(-0.1, 12*h)
##New trend values
trendn <- length(y) + 1:h

##Static forecasts combining historic and new high frequency data
forecast(mr, list(trend = trendn, x = xn), method = "static")

##Dynamic AR* model
mr.dyn <- midas_r(y ~ trend + mls(y, 1:2, 1, "*")
                   + fmls(x, 11, 12, nealmon),
                  start = list(x = rep(0, 3)))

forecast(mr.dyn, list(trend = trendn, x = xn), method = "dynamic")

##Use print, summary and plot methods from package forecast

fmr <- forecast(mr, list(trend = trendn, x = xn), method = "static")
fmr
summary(fmr)
plot(fmr)



