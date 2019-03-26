library(MLmetrics)


### Name: ConfusionMatrix
### Title: Confusion Matrix
### Aliases: ConfusionMatrix

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
ConfusionMatrix(y_pred = pred, y_true = mtcars$vs)



