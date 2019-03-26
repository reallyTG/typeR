library(qrcmNP)


### Name: piqr
### Title: Penalized Quantile Regression Coefficients Modeling
### Aliases: piqr
### Keywords: models regression

### ** Examples


  ##### Using simulated data in all examples

  ##### Example 1
  set.seed(1234)
  n <- 300
  x1 <- rexp(n)
  x2 <- runif(n, 0, 5)
  x <- cbind(x1,x2)

  b <- function(p){matrix(cbind(1, qnorm(p), slp(p, 2)), nrow=4, byrow=TRUE)}
  theta <- matrix(0, nrow=3, ncol=4); theta[, 1] <- 1; theta[1,2] <- 1; theta[2:3,3] <- 2
  qy <- function(p, theta, b, x){rowSums(x * t(theta %*% b(p)))}

  y <- qy(runif(n), theta, b, cbind(1, x))

  s <- matrix(1, nrow=3, ncol=4); s[1,3:4] <- 0; s[2:3, 2] <- 0
  obj <- piqr(y ~ x1 + x2, formula.p = ~ I(qnorm(p)) + slp(p, 2), s=s, nlambda=50)

  best <- gof.piqr(obj, method="AIC", plot=FALSE)
  best2 <- gof.piqr(obj, method="BIC", plot=FALSE)

  summary(obj, best$minLambda)
  summary(obj, best2$minLambda)

  ## Not run: 
##D   ##### other examples
##D   set.seed(1234)
##D   n <- 1000
##D   q <- 5
##D   k <- 3
##D   X <- matrix(abs(rnorm(n*q)), n, q)
##D   rownames(X) <- 1:n
##D   colnames(X) <- paste0("X", 1:q)
##D   theta <- matrix(c(3, 1.5, 1, 1,
##D                     2, 1, 1, 1,
##D                     0, 0, 0, 0,
##D                     0, 0, 0, 0,
##D                     1.5, 1, 1, 1,
##D                     0, 0, 0, 0),
##D                   ncol=(k+1), byrow=TRUE)
##D   rownames(theta) <- c("(intercept)", paste0("X", 1:q))
##D   colnames(theta) <- c("(intercept)", "slp(p,1)", "slp(p,2)", "slp(p,3)")
##D   B <- function(p, k){matrix(cbind(1, slp(p, k)), nrow=(k+1), byrow=TRUE)}
##D   Q <- function(p, theta, B, k, X){rowSums(X * t(theta %*% B(p, k)))}
##D 
##D   pp <- runif(n)
##D   y <- Q(p=pp, theta=theta, B=B, k=k, X=cbind(1, X))
##D   m1 <- piqr(y ~ X, formula.p = ~ slp(p, k))
##D   best1 <- gof.piqr(m1, method="AIC", plot=FALSE)
##D   best2 <- gof.piqr(m1, method="BIC", plot=FALSE)
##D   summary(m1, best1$minLambda)
##D   summary(m1, best2$minLambda)
##D   par(mfrow = c(2,2)); plot(m1, xvar="norm"); plot(m1, xvar="lambda");
##D                        plot(m1, xvar="objective"); plot(m1, xvar="grad")
##D 
##D   set.seed(1234)
##D   n <- 1000
##D   q <- 6
##D   k <- 4
##D   # x <- runif(n)
##D   X <- matrix(abs(rnorm(n*q)), n, q)
##D   rownames(X) <- 1:n
##D   colnames(X) <- paste0("X", 1:q)
##D   theta <- matrix(c(1, 2, 0, 0, 0,
##D                     2, 0, 1, 0, 0,
##D                     0, 0, 0, 0, 0,
##D                     1, 0, 0, 1, -1.2,
##D                     0, 0, 0, 0, 0,
##D                     1.5, 0, .5, 0, 0,
##D                     0, 0, 0, 0, 0),
##D                   ncol=(k+1), byrow=TRUE)
##D   rownames(theta) <- c("(intercept)", paste0("X", 1:q))
##D   colnames(theta) <- c("(intercept)", "qnorm(p)", "p", "log(p)", "log(1-p)")
##D   B <- function(p, k){matrix(cbind(1, qnorm(p), p, log(p), log(1-p)), nrow=(k+1), byrow=TRUE)}
##D   Q <- function(p, theta, B, k, X){rowSums(X * t(theta %*% B(p, k)))}
##D 
##D   pp <- runif(n)
##D   y <- Q(p=pp, theta=theta, B=B, k=k, X=cbind(1, X))
##D   s <- matrix(1, q+1, k+1); s[2:(q+1), 2] <- 0; s[1, 3:(k+1)] <- 0; s[2:3, 4:5] <- 0
##D   s[4:5, 3] <- 0; s[6:7, 4:5] <- 0
##D   m2 <- piqr(y ~ X, formula.p = ~ qnorm(p) + p + I(log(p)) + I(log(1-p)), s=s)
##D   best1 <- gof.piqr(m2, method="AIC", plot=FALSE)
##D   best2 <- gof.piqr(m2, method="BIC", plot=FALSE)
##D   summary(m2, best1$minLambda)
##D   summary(m2, best2$minLambda)
##D   par(mfrow = c(2,2)); plot(m1, xvar="norm"); plot(m1, xvar="lambda");
##D                        plot(m1, xvar="objective"); plot(m1, xvar="grad")
##D   
## End(Not run)
  # see the documentation for 'summary.piqr', and 'plot.piqr'



