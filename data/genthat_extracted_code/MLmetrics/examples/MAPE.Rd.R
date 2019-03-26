library(MLmetrics)


### Name: MAPE
### Title: Mean Absolute Percentage Error Loss
### Aliases: MAPE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
MAPE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



