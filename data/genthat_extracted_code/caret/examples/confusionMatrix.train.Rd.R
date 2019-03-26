library(caret)


### Name: confusionMatrix.train
### Title: Estimate a Resampled Confusion Matrix
### Aliases: confusionMatrix.train confusionMatrix.rfe confusionMatrix.sbf
### Keywords: utilities

### ** Examples



data(iris)
TrainData <- iris[,1:4]
TrainClasses <- iris[,5]

knnFit <- train(TrainData, TrainClasses,
                method = "knn",
                preProcess = c("center", "scale"),
                tuneLength = 10,
                trControl = trainControl(method = "cv"))
confusionMatrix(knnFit)
confusionMatrix(knnFit, "average")
confusionMatrix(knnFit, "none")





