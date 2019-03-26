library(performanceEstimation)


### Name: classificationMetrics
### Title: Calculate some standard classification evaluation metrics of
###   predictive performance
### Aliases: classificationMetrics
### Keywords: models

### ** Examples

## Not run: 
##D library(DMwR)
##D ## Calculating several statistics of a classification tree on the Iris data
##D data(iris)
##D idx <- sample(1:nrow(iris),100)
##D train <- iris[idx,]
##D test <- iris[-idx,]
##D tree <- rpartXse(Species ~ .,train)
##D preds <- predict(tree,test,type='class')
##D ## Calculate the  error rate
##D classificationMetrics(test$Species,preds)
##D ## Calculate the all possible error metrics
##D classificationMetrics(test$Species,preds)
##D ## Now trying calculating the utility of the predictions
##D cbM <- matrix(c(10,-20,-20,-20,20,-10,-20,-10,20),3,3)
##D classificationMetrics(test$Species,preds,"totU",cbM)
## End(Not run)



