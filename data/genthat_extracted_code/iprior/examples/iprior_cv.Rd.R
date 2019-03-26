library(iprior)


### Name: iprior_cv
### Title: Perform a cross-validation experiment with the iprior function
### Aliases: iprior_cv iprior_cv.default iprior_cv.formula

### ** Examples

## Not run: 
##D 
##D # 5-fold CV experiment
##D (mod.cv <- iprior_cv(y ~ X, gen_smooth(100), kernel = "se", folds = 5))
##D 
##D # LOOCV experiment
##D (mod.cv <- iprior_cv(y ~ X, gen_smooth(100), kernel = "se", folds = Inf))
##D 
##D # Can also get root MSE
##D print(mod.cv, "RMSE")
## End(Not run)




