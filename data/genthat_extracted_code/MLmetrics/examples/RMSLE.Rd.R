library(MLmetrics)


### Name: RMSLE
### Title: Root Mean Squared Logarithmic Error Loss
### Aliases: RMSLE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
RMSLE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



