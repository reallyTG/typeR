library(smooth)


### Name: sma
### Title: Simple Moving Average
### Aliases: sma
### Keywords: ARIMA SARIMA models nonlinear regression smooth ts univar

### ** Examples


# SMA of specific order
ourModel <- sma(rnorm(118,100,3),order=12,h=18,holdout=TRUE,intervals="p")

# SMA of arbitrary order
ourModel <- sma(rnorm(118,100,3),h=18,holdout=TRUE,intervals="sp")

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




