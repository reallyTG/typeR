library(caret)


### Name: print.train
### Title: Print Method for the train Class
### Aliases: print.train
### Keywords: print

### ** Examples


## Not run: 
##D data(iris)
##D TrainData <- iris[,1:4]
##D TrainClasses <- iris[,5]
##D 
##D options(digits = 3)
##D 
##D library(klaR)
##D rdaFit <- train(TrainData, TrainClasses, method = "rda",
##D                 control = trainControl(method = "cv"))
##D rdaFit
##D print(rdaFit, showSD = TRUE)
## End(Not run)




