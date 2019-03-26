library(caretEnsemble)


### Name: c.train
### Title: S3 definition for concatenating train objects
### Aliases: c.train

### ** Examples

## Not run: 
##D rpartTrain <- train(Class ~ .,
##D                     data=Sonar,
##D                     trControl = ctrl1,
##D                     method='rpart')
##D 
##D rfTrain <- train(Class ~ .,
##D                  data=Sonar,
##D                  trControl = ctrl1,
##D                  method='rf')
##D 
##D  bigList <- c(model_list1, model_list2)
## End(Not run)




