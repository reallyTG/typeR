library(JOUSBoost)


### Name: predict.jous
### Title: Create predictions
### Aliases: predict.jous

### ** Examples

## Not run: 
##D # Generate data from Friedman model #
##D set.seed(111)
##D dat = friedman_data(n = 500, gamma = 0.5)
##D train_index = sample(1:500, 400)
##D 
##D # Apply jous to adaboost classifier
##D class_func = function(X, y) adaboost(X, y, tree_depth = 2, n_rounds = 100)
##D pred_func = function(fit_obj, X_test) predict(fit_obj, X_test)
##D 
##D jous_fit = jous(dat$X[train_index,], dat$y[train_index], class_func,
##D                 pred_func, keep_models=TRUE)
##D # get class prediction
##D yhat = predict(jous_fit, dat$X[-train_index, ])
##D # get probability estimate
##D phat = predict(jous_fit, dat$X[-train_index, ], type="prob")
## End(Not run)



