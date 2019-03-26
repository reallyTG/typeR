library(MLmetrics)


### Name: FBeta_Score
### Title: F-Beta Score
### Aliases: FBeta_Score

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
pred <- ifelse(logreg$fitted.values < 0.5, 0, 1)
FBeta_Score(y_pred = pred, y_true = mtcars$vs, positive = "0", beta = 2)
FBeta_Score(y_pred = pred, y_true = mtcars$vs, positive = "1", beta = 2)



