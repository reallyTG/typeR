library(forecast)


### Name: tslm
### Title: Fit a linear model with time series components
### Aliases: tslm
### Keywords: stats

### ** Examples


y <- ts(rnorm(120,0,3) + 1:120 + 20*sin(2*pi*(1:120)/12), frequency=12)
fit <- tslm(y ~ trend + season)
plot(forecast(fit, h=20))




