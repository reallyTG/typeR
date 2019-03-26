library(gbts)


### Name: gbts
### Title: Hyperparameter Search for Gradient Boosted Trees
### Aliases: gbts gbts-package

### ** Examples

## Not run: 
##D # Binary classification
##D 
##D # Load German credit data
##D data(german_credit)
##D train <- german_credit$train
##D test <- german_credit$test
##D target_idx <- german_credit$target_idx
##D pred_idx <- german_credit$pred_idx
##D 
##D # Train a GBT model with optimization on AUC
##D model <- gbts(train[, pred_idx], train[, target_idx], nitr = 200, pfmc = "auc")
##D 
##D # Predict on test data
##D yhat_test <- predict(model, test[, pred_idx])
##D 
##D # Compute AUC on test data
##D comperf(test[, target_idx], yhat_test, pfmc = "auc")
##D 
##D 
##D # Regression
##D 
##D # Load Boston housing data
##D data(boston_housing)
##D train <- boston_housing$train
##D test <- boston_housing$test
##D target_idx <- boston_housing$target_idx
##D pred_idx <- boston_housing$pred_idx
##D 
##D # Train a GBT model with optimization on MSE
##D model <- gbts(train[, pred_idx], train[, target_idx], nitr = 200, pfmc = "mse")
##D 
##D # Predict on test data
##D yhat_test <- predict(model, test[, pred_idx])
##D 
##D # Compute MSE on test data
##D comperf(test[, target_idx], yhat_test, pfmc = "mse")
## End(Not run)



