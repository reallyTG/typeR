library(MLmetrics)


### Name: AUC
### Title: Area Under the Receiver Operating Characteristic Curve (ROC AUC)
### Aliases: AUC

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
AUC(y_pred = logreg$fitted.values, y_true = mtcars$vs)



