library(smooth)


### Name: forecast.smooth
### Title: Forecasting time series using smooth functions
### Aliases: forecast.smooth forecast
### Keywords: ts univar

### ** Examples


ourModel <- ces(rnorm(100,0,1),h=10)

forecast.smooth(ourModel,h=10)
forecast.smooth(ourModel,h=10,intervals=TRUE)
plot(forecast.smooth(ourModel,h=10,intervals=TRUE))




