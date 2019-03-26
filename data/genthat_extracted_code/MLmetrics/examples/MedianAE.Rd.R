library(MLmetrics)


### Name: MedianAE
### Title: Median Absolute Error Loss
### Aliases: MedianAE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
MedianAE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



