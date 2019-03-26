library(SuperLearner)


### Name: SampleSplitSuperLearner
### Title: Super Learner Prediction Function
### Aliases: SampleSplitSuperLearner
### Keywords: models

### ** Examples

## Not run: 
##D ## simulate data
##D set.seed(23432)
##D ## training set
##D n <- 500
##D p <- 50
##D X <- matrix(rnorm(n*p), nrow = n, ncol = p)
##D colnames(X) <- paste("X", 1:p, sep="")
##D X <- data.frame(X)
##D Y <- X[, 1] + sqrt(abs(X[, 2] * X[, 3])) + X[, 2] - X[, 3] + rnorm(n)
##D 
##D ## test set
##D m <- 1000
##D newX <- matrix(rnorm(m*p), nrow = m, ncol = p)
##D colnames(newX) <- paste("X", 1:p, sep="")
##D newX <- data.frame(newX)
##D newY <- newX[, 1] + sqrt(abs(newX[, 2] * newX[, 3])) + newX[, 2] -
##D   newX[, 3] + rnorm(m)
##D 
##D # generate Library and run Super Learner
##D SL.library <- c("SL.glm", "SL.randomForest", "SL.gam",
##D   "SL.polymars", "SL.mean")
##D test <- SampleSplitSuperLearner(Y = Y, X = X, newX = newX, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNLS")
##D test
##D 
##D # library with screening
##D SL.library <- list(c("SL.glmnet", "All"), c("SL.glm", "screen.randomForest",
##D   "All", "screen.SIS"), "SL.randomForest", c("SL.polymars", "All"), "SL.mean")
##D test <- SuperLearner(Y = Y, X = X, newX = newX, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNLS")
##D test
##D 
##D # binary outcome
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
##D test.NNLS <- SampleSplitSuperLearner(Y = Y, X = X, SL.library = SL.library, 
##D   verbose = TRUE, method = "method.NNLS", family = binomial())
##D test.NNLS
## End(Not run)



