library(caret)


### Name: extractPrediction
### Title: Extract predictions and class probabilities from train objects
### Aliases: extractPrediction extractProb predict.train predict.list
### Keywords: manip

### ** Examples


   ## Not run: 
##D 
##D knnFit <- train(Species ~ ., data = iris, method = "knn",
##D                 trControl = trainControl(method = "cv"))
##D 
##D rdaFit <- train(Species ~ ., data = iris, method = "rda",
##D                 trControl = trainControl(method = "cv"))
##D 
##D predict(knnFit)
##D predict(knnFit, type = "prob")
##D 
##D bothModels <- list(knn = knnFit,
##D                    tree = rdaFit)
##D 
##D predict(bothModels)
##D 
##D extractPrediction(bothModels, testX = iris[1:10, -5])
##D extractProb(bothModels, testX = iris[1:10, -5])
##D   
## End(Not run)




