library(rBayesianOptimization)


### Name: BayesianOptimization
### Title: Bayesian Optimization
### Aliases: BayesianOptimization

### ** Examples

# Example 1: Optimization
## Set Pred = 0, as placeholder
Test_Fun <- function(x) {
  list(Score = exp(-(x - 2)^2) + exp(-(x - 6)^2/10) + 1/ (x^2 + 1),
       Pred = 0)
}
## Set larger init_points and n_iter for better optimization result
OPT_Res <- BayesianOptimization(Test_Fun,
                                bounds = list(x = c(1, 3)),
                                init_points = 2, n_iter = 1,
                                acq = "ucb", kappa = 2.576, eps = 0.0,
                                verbose = TRUE)
## Not run: 
##D # Example 2: Parameter Tuning
##D library(xgboost)
##D data(agaricus.train, package = "xgboost")
##D dtrain <- xgb.DMatrix(agaricus.train$data,
##D                       label = agaricus.train$label)
##D cv_folds <- KFold(agaricus.train$label, nfolds = 5,
##D                   stratified = TRUE, seed = 0)
##D xgb_cv_bayes <- function(max.depth, min_child_weight, subsample) {
##D   cv <- xgb.cv(params = list(booster = "gbtree", eta = 0.01,
##D                              max_depth = max.depth,
##D                              min_child_weight = min_child_weight,
##D                              subsample = subsample, colsample_bytree = 0.3,
##D                              lambda = 1, alpha = 0,
##D                              objective = "binary:logistic",
##D                              eval_metric = "auc"),
##D                data = dtrain, nround = 100,
##D                folds = cv_folds, prediction = TRUE, showsd = TRUE,
##D                early.stop.round = 5, maximize = TRUE, verbose = 0)
##D   list(Score = cv$dt[, max(test.auc.mean)],
##D        Pred = cv$pred)
##D }
##D OPT_Res <- BayesianOptimization(xgb_cv_bayes,
##D                                 bounds = list(max.depth = c(2L, 6L),
##D                                               min_child_weight = c(1L, 10L),
##D                                               subsample = c(0.5, 0.8)),
##D                                 init_grid_dt = NULL, init_points = 10, n_iter = 20,
##D                                 acq = "ucb", kappa = 2.576, eps = 0.0,
##D                                 verbose = TRUE)
## End(Not run)



