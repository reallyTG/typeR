library(MLmetrics)


### Name: MedianAPE
### Title: Median Absolute Percentage Error Loss
### Aliases: MedianAPE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
MedianAPE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



