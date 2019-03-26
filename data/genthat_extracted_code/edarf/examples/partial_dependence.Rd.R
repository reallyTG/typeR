library(edarf)


### Name: partial_dependence
### Title: Partial dependence using random forests
### Aliases: partial_dependence

### ** Examples

library(randomForest)
library(edarf)

data(iris)
data(swiss)

## classification
fit = randomForest(Species ~ ., iris)
pd = partial_dependence(fit, c("Sepal.Width", "Sepal.Length"),
  data = iris[, -ncol(iris)])
pd_int = partial_dependence(fit, c("Petal.Width", "Sepal.Length"), 
  interaction = TRUE, data = iris[, -ncol(iris)])

## Regression
fit = randomForest(Fertility ~ ., swiss)
pd = partial_dependence(fit, c("Education", "Examination"), data = swiss[, -1])
pd_int = partial_dependence(fit, c("Education", "Examination"),
  interaction = TRUE, data = swiss[, -1])



