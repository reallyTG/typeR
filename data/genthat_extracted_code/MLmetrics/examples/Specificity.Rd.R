library(MLmetrics)


### Name: Specificity
### Title: Specificity
### Aliases: Specificity

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
Specificity(y_pred = pred, y_true = mtcars$vs, positive = "0")
Specificity(y_pred = pred, y_true = mtcars$vs, positive = "1")



