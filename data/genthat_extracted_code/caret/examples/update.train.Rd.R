library(caret)


### Name: update.train
### Title: Update or Re-fit a Model
### Aliases: update.train
### Keywords: models

### ** Examples


## Not run: 
##D data(iris)
##D TrainData <- iris[,1:4]
##D TrainClasses <- iris[,5]
##D 
##D knnFit1 <- train(TrainData, TrainClasses,
##D                  method = "knn",
##D                  preProcess = c("center", "scale"),
##D                  tuneLength = 10,
##D                  trControl = trainControl(method = "cv"))
##D 
##D update(knnFit1, list(.k = 3))
## End(Not run)



