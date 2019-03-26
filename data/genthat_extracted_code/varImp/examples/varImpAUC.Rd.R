library(varImp)


### Name: varImpAUC
### Title: varImpAUC
### Aliases: varImpAUC

### ** Examples

 
# multiclass case
data(iris)
iris.cf = cforest(Species ~ ., data = iris, control = cforest_unbiased(mtry = 2, ntree = 50))
set.seed(123)
a = varImpAUC(object = iris.cf, method = "ovo")
set.seed(123)
b = varImpAUC(object = iris.cf, method = "ova") 



