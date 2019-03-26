library(MLmetrics)


### Name: R2_Score
### Title: R-Squared (Coefficient of Determination) Regression Score
### Aliases: R2_Score

### ** Examples

data(cars)
reg <- lm(log(dist) ~ log(speed), data = cars)
R2_Score(y_pred = exp(reg$fitted.values), y_true = cars$dist)



