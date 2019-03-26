library(MLmetrics)


### Name: MAE
### Title: Mean Absolute Error Loss
### Aliases: MAE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
MAE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



