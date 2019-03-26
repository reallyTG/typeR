library(forecast)


### Name: forecast.lm
### Title: Forecast a linear model with possible time series components
### Aliases: forecast.lm
### Keywords: stats

### ** Examples


y <- ts(rnorm(120,0,3) + 1:120 + 20*sin(2*pi*(1:120)/12), frequency=12)
fit <- tslm(y ~ trend + season)
plot(forecast(fit, h=20))




