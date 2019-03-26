library(MLmetrics)


### Name: F1_Score
### Title: F1 Score
### Aliases: F1_Score

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
F1_Score(y_pred = pred, y_true = mtcars$vs, positive = "0")
F1_Score(y_pred = pred, y_true = mtcars$vs, positive = "1")



