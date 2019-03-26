library(ParBayesianOptimization)


### Name: BayesianOptimization
### Title: Bayesian Optimization
### Aliases: BayesianOptimization

### ** Examples

# Example 1 - Optimization of a Linear Function
scoringFunction <- function(x) {
  a <- exp(-(2-x)^2)*1.5
  b <- exp(-(4-x)^2)*2
  c <- exp(-(6-x)^2)*1
  return(list(Score = a+b+c))
}

bounds <- list(x = c(0,8))

Results <- BayesianOptimization(
    FUN = scoringFunction
  , bounds = bounds
  , initPoints = 5
  , nIters = 8
  , gsPoints = 10
)

## Not run: 
##D # Example 2 - Hyperparameter Tuning in xgboost
##D library("xgboost")
##D 
##D data(agaricus.train, package = "xgboost")
##D 
##D Folds <- list( Fold1 = as.integer(seq(1,nrow(agaricus.train$data),by = 3))
##D              , Fold2 = as.integer(seq(2,nrow(agaricus.train$data),by = 3))
##D              , Fold3 = as.integer(seq(3,nrow(agaricus.train$data),by = 3)))
##D 
##D scoringFunction <- function(max_depth, min_child_weight, subsample) {
##D 
##D   dtrain <- xgb.DMatrix(agaricus.train$data,label = agaricus.train$label)
##D 
##D   Pars <- list( booster = "gbtree"
##D               , eta = 0.01
##D               , max_depth = max_depth
##D               , min_child_weight = min_child_weight
##D               , subsample = subsample
##D               , objective = "binary:logistic"
##D               , eval_metric = "auc")
##D 
##D   xgbcv <- xgb.cv( params = Pars
##D                  , data = dtrain
##D                  , nround = 100
##D                  , folds = Folds
##D                  , prediction = TRUE
##D                  , showsd = TRUE
##D                  , early_stopping_rounds = 5
##D                  , maximize = TRUE
##D                  , verbose = 0)
##D 
##D   return(list( Score = max(xgbcv$evaluation_log$test_auc_mean)
##D              , nrounds = xgbcv$best_iteration
##D   )
##D   )
##D }
##D 
##D bounds <- list(max_depth = c(2L, 10L)
##D              , min_child_weight = c(1, 100)
##D              , subsample = c(0.25, 1))
##D 
##D kern <- "Matern52"
##D 
##D acq <- "ei"
##D 
##D ScoreResult <- BayesianOptimization(
##D     FUN = scoringFunction
##D   , bounds = bounds
##D   , initPoints = 10
##D   , bulkNew = 1
##D   , nIters = 12
##D   , kern = kern
##D   , acq = acq
##D   , kappa = 2.576
##D   , verbose = 1
##D   , parallel = FALSE
##D   , gsPoints = 50)
## End(Not run)



