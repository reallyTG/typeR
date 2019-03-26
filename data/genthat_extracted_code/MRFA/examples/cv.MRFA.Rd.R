library(MRFA)


### Name: cv.MRFA
### Title: Compute K-fold cross-validated error for Multi-Resolution
###   Functional ANOVA (MRFA) Model
### Aliases: cv.MRFA

### ** Examples

## Not run: 
##D 
##D #####             Testing function: GRAMACY & LEE (2009) function             #####
##D #####   Thanks to Sonja Surjanovic and Derek Bingham, Simon Fraser University #####
##D grlee09 <- function(xx)
##D {
##D   x1 <- xx[1]
##D   x2 <- xx[2]
##D   x3 <- xx[3]
##D   x4 <- xx[4]
##D   x5 <- xx[5]
##D   x6 <- xx[6]
##D 
##D   term1 <- exp(sin((0.9*(x1+0.48))^10))
##D   term2 <- x2 * x3
##D   term3 <- x4
##D 
##D   y <- term1 + term2 + term3
##D   return(y)
##D }
##D 
##D library(MRFA)
##D #####   Training data and testing data   #####
##D set.seed(2)
##D n <- 100; n_rep <- 3; n_new <- 50; d <- 6
##D X.train <- matrix(runif(d*n), ncol = d)
##D X.train <- matrix(rep(X.train, each = n_rep), ncol = d)
##D Y.train <- apply(X.train, 1, grlee09)
##D Y.train <- Y.train + rnorm(n*n_rep, 0, 0.05)
##D X.test <- matrix(runif(d*n_new), ncol = d)
##D Y.test <- apply(X.test, 1, grlee09)
##D 
##D #####   Fitting    #####
##D MRFA_model <- MRFA_fit(X.train, Y.train)
##D 
##D #####   Computes the K-fold cross validated   #####
##D cv.out <- cv.MRFA(X.train, Y.train, K = 5, lambda = seq(0.01,3,0.1))
##D 
##D #####   Prediction : CV  ######
##D lambda_cv <- cv.out$lambda[which.min(cv.out$cv)]
##D Y.pred <- predict(MRFA_model, X.test, lambda = lambda_cv)$y_hat
##D print(sqrt(mean((Y.test - Y.pred)^2)))
## End(Not run)



