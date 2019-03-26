library(edarf)


### Name: variable_importance
### Title: Variable importance using random forests
### Aliases: variable_importance

### ** Examples

library(randomForest)
data(iris)
fit = randomForest(Species ~ ., iris)
variable_importance(fit, nperm = 2, data = iris)



