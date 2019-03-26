library(brms)


### Name: kfold_predict
### Title: Predictions of K-Fold Cross-Validation
### Aliases: kfold_predict

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Base4_c * Trt + (1|patient),
##D            data = epilepsy, family = poisson())
##D             
##D # perform k-fold cross validation
##D (kf <- kfold(fit, save_fits = TRUE, chains = 1))
##D 
##D # define a loss function
##D rmse <- function(y, yrep) {
##D   yrep_mean <- colMeans(yrep)
##D   sqrt(mean((yrep_mean - y)^2))
##D }
##D 
##D # predict responses and evaluate the loss
##D kfp <- kfold_predict(kf)
##D rmse(y = kfp$y, yrep = kfp$yrep)
## End(Not run)
  



