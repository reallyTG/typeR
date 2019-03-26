library(SuperLearner)


### Name: SuperLearner
### Title: Super Learner Prediction Function
### Aliases: SuperLearner mcSuperLearner snowSuperLearner
###   print.SuperLearner coef.SuperLearner
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
##D test <- SuperLearner(Y = Y, X = X, newX = newX, SL.library = SL.library,
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
##D test.NNLS <- SuperLearner(Y = Y, X = X, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNLS", family = binomial())
##D test.NNLS
##D 
##D # negative log binomial likelihood loss function
##D test.NNloglik <- SuperLearner(Y = Y, X = X, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNloglik", family = binomial())
##D test.NNloglik
##D 
##D # 1 - AUC loss function
##D test.AUC <- SuperLearner(Y = Y, X = X, SL.library = SL.library,
##D   verbose = TRUE, method = "method.AUC", family = binomial())
##D test.AUC
##D 
##D # 2
##D # adapted from library(SIS)
##D set.seed(1)
##D # training
##D b <- c(2, 2, 2, -3*sqrt(2))
##D n <- 150
##D p <- 200
##D truerho <- 0.5
##D corrmat <- diag(rep(1-truerho, p)) + matrix(truerho, p, p)
##D corrmat[, 4] = sqrt(truerho)
##D corrmat[4, ] = sqrt(truerho)
##D corrmat[4, 4] = 1
##D cholmat <- chol(corrmat)
##D x <- matrix(rnorm(n*p, mean=0, sd=1), n, p)
##D x <- x ##D 
##D feta <- x[, 1:4] ##D 
##D fprob <- exp(feta) / (1 + exp(feta))
##D y <- rbinom(n, 1, fprob)
##D 
##D # test
##D m <- 10000
##D newx <- matrix(rnorm(m*p, mean=0, sd=1), m, p)
##D newx <- newx ##D 
##D newfeta <- newx[, 1:4] ##D 
##D newfprob <- exp(newfeta) / (1 + exp(newfeta))
##D newy <- rbinom(m, 1, newfprob)
##D 
##D DATA2 <- data.frame(Y = y, X = x)
##D newDATA2 <- data.frame(Y = newy, X=newx)
##D 
##D create.SL.knn <- function(k = c(20, 30)) {
##D   for(mm in seq(length(k))){
##D     eval(parse(text = paste('SL.knn.', k[mm], '<- function(..., k = ', k[mm],
##D       ') SL.knn(..., k = k)', sep = '')), envir = .GlobalEnv)
##D   }
##D   invisible(TRUE)
##D }
##D create.SL.knn(c(20, 30, 40, 50, 60, 70))
##D 
##D # library with screening
##D SL.library <- list(c("SL.glmnet", "All"), c("SL.glm", "screen.randomForest"),
##D   "SL.randomForest", "SL.knn", "SL.knn.20", "SL.knn.30", "SL.knn.40",
##D   "SL.knn.50", "SL.knn.60", "SL.knn.70",
##D   c("SL.polymars", "screen.randomForest"))
##D test <- SuperLearner(Y = DATA2$Y, X = DATA2[, -1], newX = newDATA2[, -1],
##D   SL.library = SL.library, verbose = TRUE, family = binomial())
##D test
##D 
##D ## examples with multicore
##D set.seed(23432, "L'Ecuyer-CMRG")  # use L'Ecuyer for multicore seeds. see ?set.seed for details
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
##D newY <- newX[, 1] + sqrt(abs(newX[, 2] * newX[, 3])) + newX[, 2] - newX[, 3] + rnorm(m)
##D 
##D # generate Library and run Super Learner
##D SL.library <- c("SL.glm", "SL.randomForest", "SL.gam",
##D   "SL.polymars", "SL.mean")
##D 
##D testMC <- mcSuperLearner(Y = Y, X = X, newX = newX, SL.library = SL.library,
##D   method = "method.NNLS")
##D testMC
##D 
##D ## examples with snow
##D library(parallel)
##D cl <- makeCluster(2, type = "PSOCK") # can use different types here
##D clusterSetRNGStream(cl, iseed = 2343)
##D testSNOW <- snowSuperLearner(cluster = cl, Y = Y, X = X, newX = newX,
##D   SL.library = SL.library, method = "method.NNLS")
##D testSNOW
##D stopCluster(cl)
##D 
##D ## snow example with user-generated wrappers
##D # If you write your own wrappers and are using snowSuperLearner()
##D # These new wrappers need to be added to the SuperLearner namespace and exported to the clusters
##D # Using a simple example here, but can define any new SuperLearner wrapper
##D my.SL.wrapper <- function(...) SL.glm(...)
##D # assign function into SuperLearner namespace
##D environment(my.SL.wrapper) <-asNamespace("SuperLearner")
##D 
##D cl <- makeCluster(2, type = "PSOCK") # can use different types here
##D clusterSetRNGStream(cl, iseed = 2343)
##D clusterExport(cl, c("my.SL.wrapper"))  # copy the function to all clusters
##D testSNOW <- snowSuperLearner(cluster = cl, Y = Y, X = X, newX = newX,
##D   SL.library = c("SL.glm", "SL.mean", "my.SL.wrapper"), method = "method.NNLS")
##D testSNOW
##D stopCluster(cl)
##D 
##D ## timing
##D replicate(5, system.time(SuperLearner(Y = Y, X = X, newX = newX,
##D   SL.library = SL.library, method = "method.NNLS")))
##D 
##D replicate(5, system.time(mcSuperLearner(Y = Y, X = X, newX = newX,
##D   SL.library = SL.library, method = "method.NNLS")))
##D 
##D cl <- makeCluster(2, type = 'PSOCK')
##D replicate(5, system.time(snowSuperLearner(cl, Y = Y, X = X, newX = newX,
##D   SL.library = SL.library, method = "method.NNLS")))
##D stopCluster(cl)
##D 
## End(Not run)



