library(MLmetrics)


### Name: LiftAUC
### Title: Area Under the Lift Chart
### Aliases: LiftAUC

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
LiftAUC(y_pred = logreg$fitted.values, y_true = mtcars$vs)



