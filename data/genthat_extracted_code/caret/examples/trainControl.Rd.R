library(caret)


### Name: trainControl
### Title: Control parameters for train
### Aliases: trainControl
### Keywords: utilities

### ** Examples


## Not run: 
##D 
##D ## Do 5 repeats of 10-Fold CV for the iris data. We will fit
##D ## a KNN model that evaluates 12 values of k and set the seed
##D ## at each iteration.
##D 
##D set.seed(123)
##D seeds <- vector(mode = "list", length = 51)
##D for(i in 1:50) seeds[[i]] <- sample.int(1000, 22)
##D 
##D ## For the last model:
##D seeds[[51]] <- sample.int(1000, 1)
##D 
##D ctrl <- trainControl(method = "repeatedcv",
##D                      repeats = 5,
##D                      seeds = seeds)
##D 
##D set.seed(1)
##D mod <- train(Species ~ ., data = iris,
##D              method = "knn",
##D              tuneLength = 12,
##D              trControl = ctrl)
##D 
##D 
##D ctrl2 <- trainControl(method = "adaptive_cv",
##D                       repeats = 5,
##D                       verboseIter = TRUE,
##D                       seeds = seeds)
##D 
##D set.seed(1)
##D mod2 <- train(Species ~ ., data = iris,
##D               method = "knn",
##D               tuneLength = 12,
##D               trControl = ctrl2)
##D 
## End(Not run)




