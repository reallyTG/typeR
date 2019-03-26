library(MLmetrics)


### Name: RAE
### Title: Relative Absolute Error Loss
### Aliases: RAE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
RAE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



