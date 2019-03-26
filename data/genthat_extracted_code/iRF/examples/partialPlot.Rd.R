library(iRF)


### Name: partialPlot
### Title: Partial dependence plot
### Aliases: partialPlot partialPlot.default partialPlot.randomForest
### Keywords: classif regression tree

### ** Examples

data(iris)
set.seed(543)
iris.rf <- randomForest(Species~., iris)
partialPlot(iris.rf, iris, Petal.Width, "versicolor")



