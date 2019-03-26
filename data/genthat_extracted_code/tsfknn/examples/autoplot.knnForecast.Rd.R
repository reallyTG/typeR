library(tsfknn)


### Name: autoplot.knnForecast
### Title: Create a ggplot object from a knnForecast object
### Aliases: autoplot.knnForecast

### ** Examples

pred <- knn_forecasting(USAccDeaths, h = 12, lags = 1:12, k = 2)
library(ggplot2)
autoplot(pred)
autoplot(pred, highlight = "neighbors")



