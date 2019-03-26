library(MLmetrics)


### Name: ZeroOneLoss
### Title: Normalized Zero-One Loss (Classification Error Loss)
### Aliases: ZeroOneLoss

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
ZeroOneLoss(y_pred = pred, y_true = mtcars$vs)



