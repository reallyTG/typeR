library(LEGIT)


### Name: LEGIT_cv
### Title: Cross-validation for the LEGIT model
### Aliases: LEGIT_cv

### ** Examples

## Not run: 
##D train = example_3way(250, 2.5, seed=777)
##D # Cross-validation 4 times with 5 Folds
##D cv_5folds = LEGIT_cv(train$data, train$G, train$E, y ~ G*E*z, cv_iter=4, cv_folds=5)
##D cv_5folds
##D # Leave-one-out cross-validation (Note: very slow)
##D cv_loo = LEGIT_cv(train$data, train$G, train$E, y ~ G*E*z, cv_iter=1, cv_folds=250)
##D cv_loo
##D # Cross-validation 4 times with 5 Folds (binary outcome)
##D train_bin = example_2way(500, 2.5, logit=TRUE, seed=777)
##D cv_5folds_bin = LEGIT_cv(train_bin$data, train_bin$G, train_bin$E, y ~ G*E, 
##D cv_iter=4, cv_folds=5, classification=TRUE, family=binomial)
##D cv_5folds_bin
##D par(mfrow=c(2,2))
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[1]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[2]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[3]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[4]])
## End(Not run)



