library(randomForest)


### Name: margin
### Title: Margins of randomForest Classifier
### Aliases: margin margin.default margin.randomForest plot.margin
### Keywords: classif

### ** Examples

set.seed(1)
data(iris)
iris.rf <- randomForest(Species ~ ., iris, keep.forest=FALSE)
plot(margin(iris.rf))



