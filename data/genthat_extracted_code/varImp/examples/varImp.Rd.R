library(varImp)


### Name: varImp
### Title: varImp
### Aliases: varImp

### ** Examples

# multiclass case
data(iris)
iris.cf = cforest(Species ~ ., data = iris, control = cforest_unbiased(mtry = 2, ntree = 50))
set.seed(123)
a = varImp(object = iris.cf, measure = "multiclass.Brier")



