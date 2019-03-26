library(MLmetrics)


### Name: GainAUC
### Title: Area Under the Gain Chart
### Aliases: GainAUC

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
GainAUC(y_pred = logreg$fitted.values, y_true = mtcars$vs)



