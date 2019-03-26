library(MLmetrics)


### Name: RRSE
### Title: Root Relative Squared Error Loss
### Aliases: RRSE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
RRSE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



