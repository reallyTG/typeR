library(forestControl)


### Name: extract_params
### Title: Extract forest parameters
### Aliases: extract_params

### ** Examples

library(randomForest)
data(iris)
iris.rf <- randomForest(iris[,-5], iris[,5], forest = TRUE)

iris.params <- extract_params(iris.rf)
print(iris.params)



