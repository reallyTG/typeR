library(MLmetrics)


### Name: MSE
### Title: Mean Square Error Loss
### Aliases: MSE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
MSE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



