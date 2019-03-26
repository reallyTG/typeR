library(MLmetrics)


### Name: PRAUC
### Title: Area Under the Precision-Recall Curve (PR AUC)
### Aliases: PRAUC

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
PRAUC(y_pred = logreg$fitted.values, y_true = mtcars$vs)



