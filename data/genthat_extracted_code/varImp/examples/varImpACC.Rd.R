library(varImp)


### Name: varImpACC
### Title: varImpACC
### Aliases: varImpACC

### ** Examples

data(iris)
iris2 = iris
iris2$Species = factor(iris$Species == "versicolor")
iris.cf = cforest(Species ~ ., data = iris2,control = cforest_unbiased(mtry = 2, ntree = 50))
set.seed(123)
a = varImpACC(object = iris.cf)




