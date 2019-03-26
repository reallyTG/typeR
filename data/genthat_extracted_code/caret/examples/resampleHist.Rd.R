library(caret)


### Name: resampleHist
### Title: Plot the resampling distribution of the model statistics
### Aliases: resampleHist
### Keywords: hplot

### ** Examples



## Not run: 
##D data(iris)
##D TrainData <- iris[,1:4]
##D TrainClasses <- iris[,5]
##D 
##D knnFit <- train(TrainData, TrainClasses, "knn")
##D 
##D resampleHist(knnFit)
## End(Not run)




