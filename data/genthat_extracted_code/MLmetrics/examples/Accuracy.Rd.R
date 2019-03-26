library(MLmetrics)


### Name: Accuracy
### Title: Accuracy
### Aliases: Accuracy

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
Accuracy(y_pred = pred, y_true = mtcars$vs)



