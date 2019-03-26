library(MLmetrics)


### Name: Recall
### Title: Recall
### Aliases: Recall

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
Recall(y_pred = pred, y_true = mtcars$vs, positive = "0")
Recall(y_pred = pred, y_true = mtcars$vs, positive = "1")



