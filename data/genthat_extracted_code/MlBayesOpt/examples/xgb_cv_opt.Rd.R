library(MlBayesOpt)


### Name: xgb_cv_opt
### Title: Bayesian Optimization for XGboost(Cross Validation)
### Aliases: xgb_cv_opt

### ** Examples

library(MlBayesOpt)

set.seed(71)
res0 <- xgb_cv_opt(data = iris,
                   label = Species,
                   objectfun = "multi:softmax",
                   evalmetric = "mlogloss",
                   n_folds = 3,
                   classes = 3,
                   init_points = 2,
                   n_iter = 1)




