library(LEGIT)


### Name: IMLEGIT_cv
### Title: Cross-validation for the IMLEGIT model
### Aliases: IMLEGIT_cv

### ** Examples

## Not run: 
##D train = example_3way_3latent(250, 1, seed=777)
##D # Cross-validation 4 times with 5 Folds
##D cv_5folds = IMLEGIT_cv(train$data, train$latent_var, y ~ G*E*Z, cv_iter=4, cv_folds=5)
##D cv_5folds
##D # Leave-one-out cross-validation (Note: very slow)
##D cv_loo = IMLEGIT_cv(train$data, train$latent_var, y ~ G*E*Z, cv_iter=1, cv_folds=250)
##D cv_loo
##D # Cross-validation 4 times with 5 Folds (binary outcome)
##D train_bin = example_2way(500, 2.5, logit=TRUE, seed=777)
##D cv_5folds_bin = IMLEGIT_cv(train_bin$data, list(G=train_bin$G, E=train_bin$E), y ~ G*E, 
##D cv_iter=4, cv_folds=5, classification=TRUE, family=binomial)
##D cv_5folds_bin
##D par(mfrow=c(2,2))
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[1]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[2]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[3]])
##D pROC::plot.roc(cv_5folds_bin$roc_curve[[4]])
## End(Not run)



