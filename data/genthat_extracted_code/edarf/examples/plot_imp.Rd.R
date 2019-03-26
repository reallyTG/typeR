library(edarf)


### Name: plot_imp
### Title: Plot variable importance from random forests
### Aliases: plot_imp

### ** Examples

library(randomForest)
data(iris)
fit = randomForest(Species ~ ., iris)
imp = variable_importance(fit, nperm = 2, data = iris)
plot_imp(imp)



