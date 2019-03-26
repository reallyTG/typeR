library(JOUSBoost)


### Name: jous
### Title: Jittering with Over/Under Sampling
### Aliases: jous

### ** Examples

## Not run: 
##D # Generate data from Friedman model #
##D set.seed(111)
##D dat = friedman_data(n = 500, gamma = 0.5)
##D train_index = sample(1:500, 400)
##D 
##D # Apply jous to adaboost classifier
##D class_func = function(X, y) adaboost(X, y, tree_depth = 2, n_rounds = 200)
##D pred_func = function(fit_obj, X_test) predict(fit_obj, X_test)
##D 
##D jous_fit = jous(dat$X[train_index,], dat$y[train_index], class_func,
##D                 pred_func, keep_models = TRUE)
##D # get probability
##D phat_jous = predict(jous_fit, dat$X[-train_index, ], type = "prob")
##D 
##D # compare with probability from AdaBoost
##D ada = adaboost(dat$X[train_index,], dat$y[train_index], tree_depth = 2,
##D                n_rounds = 200)
##D phat_ada = predict(ada, dat$X[train_index,], type = "prob")
##D 
##D mean((phat_jous - dat$p[-train_index])^2)
##D mean((phat_ada - dat$p[-train_index])^2)
##D 
##D ## Example using parallel option
##D 
##D library(doParallel)
##D cl <- makeCluster(4)
##D registerDoParallel(cl)
##D 
##D # n.b. the packages='rpart' is not really needed here since it gets
##D # exported automatically by JOUSBoost, but for illustration
##D jous_fit = jous(dat$X[train_index,], dat$y[train_index], class_func,
##D                 pred_func, keep_models = TRUE, parallel = TRUE,
##D                 packages = 'rpart')
##D phat = predict(jous_fit, dat$X[-train_index,], type = 'prob')
##D stopCluster(cl)
##D 
##D ## Example using SVM
##D 
##D library(kernlab)
##D class_func = function(X, y) ksvm(X, as.factor(y), kernel = 'rbfdot')
##D pred_func = function(obj, X) as.numeric(as.character(predict(obj, X)))
##D jous_obj = jous(dat$X[train_index,], dat$y[train_index], class_func = class_func,
##D            pred_func = pred_func, keep_models = TRUE)
##D jous_pred = predict(jous_obj, dat$X[-train_index,], type = 'prob')
## End(Not run)



