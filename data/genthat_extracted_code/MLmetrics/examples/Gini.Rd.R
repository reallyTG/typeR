library(MLmetrics)


### Name: Gini
### Title: Gini Coefficient
### Aliases: Gini

### ** Examples

data(cars)
logreg <- glm(formula = vs ~ hp + wt,
              family = binomial(link = "logit"), data = mtcars)
Gini(y_pred = logreg$fitted.values, y_true = mtcars$vs)



