library(caret)


### Name: dotPlot
### Title: Create a dotplot of variable importance values
### Aliases: dotPlot
### Keywords: hplot

### ** Examples



data(iris)
TrainData <- iris[,1:4]
TrainClasses <- iris[,5]

knnFit <- train(TrainData, TrainClasses, "knn")

knnImp <- varImp(knnFit)

dotPlot(knnImp)





