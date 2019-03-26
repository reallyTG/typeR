library(iRF)


### Name: grow
### Title: Add trees to an ensemble
### Aliases: grow grow.default grow.randomForest
### Keywords: regression classif

### ** Examples

data(iris)
iris.rf <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)
iris.rf <- grow(iris.rf, 50)
print(iris.rf)



