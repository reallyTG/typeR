library(MLmetrics)


### Name: LogLoss
### Title: Log loss / Cross-Entropy Loss
### Aliases: LogLoss

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
LogLoss(y_pred = logreg$fitted.values, y_true = mtcars$vs)



