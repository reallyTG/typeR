library(live)


### Name: add_predictions
### Title: Add black box predictions to generated dataset
### Aliases: add_predictions

### ** Examples

## Not run: 
##D # Train a model inside add_predictions call.
##D local_exploration1 <- add_predictions(dataset_for_local_exploration,
##D                                       black_box_model = "regr.svm",
##D                                       data = wine)
##D # Pass trained model to the function.
##D svm_model <- svm(quality ~., data = wine)
##D local_exploration2 <- add_predictions(dataset_for_local_exploration,
##D                                       black_box_model = svm_model)
## End(Not run)




