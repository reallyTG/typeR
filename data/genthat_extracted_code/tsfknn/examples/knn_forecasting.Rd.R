library(tsfknn)


### Name: knn_forecasting
### Title: Time series forecasting using KNN regression
### Aliases: knn_forecasting

### ** Examples

pred <- knn_forecasting(USAccDeaths, h = 12, lags = 1:12, k = 2)
pred$prediction # To see a time series with the forecasts
plot(pred) # To see a plot with the forecast



