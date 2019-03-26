library(MLmetrics)


### Name: RMSPE
### Title: Root Mean Square Percentage Error Loss
### Aliases: RMSPE

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
RMSPE(y_pred = exp(reg$fitted.values), y_true = cars$dist)



