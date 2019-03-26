library(iprior)


### Name: tecator.cv
### Title: Results of I-prior cross-validation experiment on Tecator data
###   set
### Aliases: tecator.cv
### Keywords: datasets

### ** Examples

# Results from the six experiments
print(tecator.cv[[1]], "RMSE")
print(tecator.cv[[2]], "RMSE")
print(tecator.cv[[3]], "RMSE")
print(tecator.cv[[4]], "RMSE")
print(tecator.cv[[5]], "RMSE")
print(tecator.cv[[6]], "RMSE")

# Summary of results
print(tecator.cv[[7]])

## Not run: 
##D 
##D # Prepare data set
##D data(tecator, package = "caret")
##D endpoints <- as.data.frame(endpoints)
##D colnames(endpoints) <- c("water", "fat", "protein")
##D absorp <- -t(diff(t(absorp)))  # this takes first differences using diff()
##D fat <- endpoints$fat
##D 
##D # Here is the code to replicate the results
##D mod1.cv <- iprior_cv(fat, absorp, folds = Inf)
##D mod2.cv <- iprior_cv(fat, absorp, folds = Inf, kernel = "poly2",
##D                      est.offset = TRUE)
##D mod3.cv <- iprior_cv(fat, absorp, folds = Inf, kernel = "poly3",
##D                      est.offset = TRUE)
##D mod4.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "fbm",
##D                      control = list(stop.crit = 1e-2))
##D mod5.cv <- iprior_cv(fat, absorp, folds = Inf, kernel = "fbm",
##D                      est.hurst = TRUE, control = list(stop.crit = 1e-2))
##D mod6.cv <- iprior_cv(fat, absorp, folds = Inf, kernel = "se",
##D                      est.lengthscale = TRUE, control = list(stop.crit = 1e-2))
##D 
##D tecator_res_cv <- function(mod) {
##D   res <- as.numeric(apply(mod$res[, -1], 2, mean))  # Calculate RMSE
##D   c("Training RMSE" = res[1], "Test RMSE" = res[2])
##D }
##D 
##D tecator_tab_cv <- function() {
##D   tab <- t(sapply(list(mod1.cv, mod2.cv, mod3.cv, mod4.cv, mod5.cv, mod6.cv),
##D                   tecator_res_cv))
##D   rownames(tab) <- c("Linear", "Quadratic", "Cubic", "fBm-0.5", "fBm-MLE",
##D                      "SE-MLE")
##D   tab
##D }
##D 
##D tecator.cv <- list(
##D   "linear"   = mod1.cv,
##D   "qudratic" = mod2.cv,
##D   "cubic"    = mod3.cv,
##D   "fbm-0.5"  = mod4.cv,
##D   "fbm-MLE"  = mod5.cv,
##D   "SE"       = mod6.cv,
##D   "summary"  = tecator_tab_cv()
##D )
## End(Not run)





