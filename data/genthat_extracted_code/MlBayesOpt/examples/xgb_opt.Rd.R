library(MlBayesOpt)


### Name: xgb_opt
### Title: Bayesian Optimization for XGboost
### Aliases: xgb_opt

### ** Examples

## Not run: 
##D library(MlBayesOpt)
##D 
##D set.seed(71)
##D res0 <- xgb_opt(train_data = fashion_train,
##D                 train_label = y,
##D                 test_data = fashion_test,
##D                 test_label = y,
##D                 objectfun = "multi:softmax",
##D                 evalmetric = "merror",
##D                 classes = 10,
##D                 init_points = 3,
##D                 n_iter = 1)
## End(Not run)




