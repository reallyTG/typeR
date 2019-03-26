library(SuperLearner)


### Name: recombineSL
### Title: Recombine a SuperLearner fit using a new metalearning method
### Aliases: recombineSL
### Keywords: models

### ** Examples

## Not run: 
##D 
##D # Binary outcome example adapted from SuperLearner examples
##D 
##D set.seed(1)
##D N <- 200
##D X <- matrix(rnorm(N*10), N, 10)
##D X <- as.data.frame(X)
##D Y <- rbinom(N, 1, plogis(.2*X[, 1] + .1*X[, 2] - .2*X[, 3] + 
##D   .1*X[, 3]*X[, 4] - .2*abs(X[, 4])))
##D 
##D SL.library <- c("SL.glmnet", "SL.glm", "SL.knn", "SL.gam", "SL.mean")
##D 
##D # least squares loss function
##D set.seed(1) # for reproducibility
##D fit_nnls <- SuperLearner(Y = Y, X = X, SL.library = SL.library, 
##D   verbose = TRUE, method = "method.NNLS", family = binomial())
##D fit_nnls
##D #                    Risk       Coef
##D # SL.glmnet_All 0.2439433 0.01293059
##D # SL.glm_All    0.2461245 0.08408060
##D # SL.knn_All    0.2604000 0.09600353
##D # SL.gam_All    0.2471651 0.40761918
##D # SL.mean_All   0.2486049 0.39936611
##D 
##D 
##D # negative log binomial likelihood loss function
##D fit_nnloglik <- recombineSL(fit_nnls, Y = Y, method = "method.NNloglik")
##D fit_nnloglik
##D #                    Risk      Coef
##D # SL.glmnet_All 0.6815911 0.1577228
##D # SL.glm_All    0.6918926 0.0000000
##D # SL.knn_All          Inf 0.0000000
##D # SL.gam_All    0.6935383 0.6292881
##D # SL.mean_All   0.6904050 0.2129891
##D 
##D # If we use the same seed as the original `fit_nnls`, then
##D # the recombineSL and SuperLearner results will be identical
##D # however, the recombineSL version will be much faster since
##D # it doesn't have to re-fit all the base learners.
##D set.seed(1)
##D fit_nnloglik2 <- SuperLearner(Y = Y, X = X, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNloglik", family = binomial())
##D fit_nnloglik2
##D #                    Risk      Coef
##D # SL.glmnet_All 0.6815911 0.1577228
##D # SL.glm_All    0.6918926 0.0000000
##D # SL.knn_All          Inf 0.0000000
##D # SL.gam_All    0.6935383 0.6292881
##D # SL.mean_All   0.6904050 0.2129891
##D 
## End(Not run)



