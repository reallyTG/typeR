library(SuperLearner)


### Name: CV.SuperLearner
### Title: Function to get V-fold cross-validated risk estimate for super
###   learner
### Aliases: CV.SuperLearner print.CV.SuperLearner coef.CV.SuperLearner
### Keywords: models

### ** Examples

## Not run: 
##D set.seed(23432)
##D ## training set
##D n <- 500
##D p <- 50
##D X <- matrix(rnorm(n*p), nrow = n, ncol = p)
##D colnames(X) <- paste("X", 1:p, sep="")
##D X <- data.frame(X)
##D Y <- X[, 1] + sqrt(abs(X[, 2] * X[, 3])) + X[, 2] - X[, 3] + rnorm(n)
##D 
##D ## build Library and run Super Learner
##D SL.library <- c("SL.glm", "SL.randomForest", "SL.gam", "SL.polymars", "SL.mean")
##D 
##D test <- CV.SuperLearner(Y = Y, X = X, V = 10, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNLS")
##D test
##D summary(test)
##D ## Look at the coefficients across folds
##D coef(test)
##D 
##D # Example with specifying cross-validation options for both 
##D # CV.SuperLearner (cvControl) and the internal SuperLearners (innerCvControl)
##D test <- CV.SuperLearner(Y = Y, X = X, SL.library = SL.library,
##D   cvControl = list(V = 10, shuffle = FALSE),
##D   innerCvControl = list(list(V = 5)),
##D   verbose = TRUE, method = "method.NNLS")
##D 
##D ## examples with snow
##D library(parallel)
##D cl <- makeCluster(2, type = "PSOCK") # can use different types here
##D clusterSetRNGStream(cl, iseed = 2343)
##D testSNOW <- CV.SuperLearner(Y = Y, X = X, SL.library = SL.library, method = "method.NNLS",
##D   parallel = cl)
##D summary(testSNOW)
##D stopCluster(cl)
## End(Not run)



