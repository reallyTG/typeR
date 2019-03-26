library(MLmetrics)


### Name: RMSE
### Title: Root Mean Square Error Loss
### Aliases: RMSE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
RMSE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



