library(bivrp)


### Name: bivrp
### Title: Bivariate Residual Plots with Simulation Polygons
### Aliases: bivrp

### ** Examples

## simulating a bivariate normal response variable

require(mvtnorm)

n <- 40
beta1 <- c(2, .4)
beta2 <- c(.2, .2)
x <- seq(1, 10, length = n)
X <- model.matrix(~ x)
mu1 <- X%*%beta1
mu2 <- X%*%beta2
sig1 <- 2
sig2 <- 3
sig12 <- -1.7
Sig1 <- diag(rep(sig1), n)
Sig2 <- diag(rep(sig2), n)
Sig12 <- diag(rep(sig12), n)
V <- rbind(cbind(Sig1, Sig12),
           cbind(Sig12, Sig2))

set.seed(2016)
Y <- as.numeric(rmvnorm(1, c(mu1, mu2), V))

## code for fitting the model estimating covariance or not
bivnormfit <- function(Y, X, covariance) {
  n <- nrow(X)
  p <- ncol(X)
  y <- cbind(Y[1:n],Y[(n+1):(2*n)])
  XtXinv <- solve(crossprod(X, X))
  beta.hat <- XtXinv %*% crossprod(X, y)
  mu.hat <- X%*%beta.hat
  sigma.hat <- 1/n * t(y - mu.hat) %*% (y - mu.hat)
  if(!covariance) sigma.hat <- diag(diag(sigma.hat))
  cov.betas <- sigma.hat %x% XtXinv
  se.s1 <- sqrt(2*sigma.hat[1]^2/(n-p+1))
  se.s2 <- sqrt(2*sigma.hat[4]^2/(n-p+1))
  if(!covariance) se.s12 <- NA else {
    rho <- sigma.hat[2]/sqrt(sigma.hat[1]*sigma.hat[4])
    se.s12 <- sqrt((1+rho^2)*sigma.hat[1]*sigma.hat[4]/(n-p+1))
  }
  se.betas <- sqrt(diag(cov.betas))
  se.sigma <- c(se.s1, se.s2, se.s12)
  coefs <- c(beta.hat, sigma.hat[1], sigma.hat[4], sigma.hat[2])
  names(coefs) <- c("beta1.0", "beta1.1", "beta2.0", "beta2.1", "sig1", "sig2", "sig12")
  fitted <- c(mu.hat)
  resid <- Y - fitted
  Sig1 <- diag(rep(sigma.hat[1]), n)
  Sig2 <- diag(rep(sigma.hat[4]), n)
  Sig12 <- diag(rep(sigma.hat[2]), n)
  V <- rbind(cbind(Sig1, Sig12),
             cbind(Sig12, Sig2))
  llik <- dmvnorm(Y, c(mu.hat), V, log = TRUE)
  ret <- list("coefs" = coefs, "covariance" = covariance, "n" = n, 
              "X" = X, "fitted" = fitted, "resid" = resid, "loglik" = llik,
              "Y" = Y, "se" = c(se.betas, se.sigma))
  class(ret) <- "bivnormfit"
  return(ret)
}

## fitting bivariate models with and without estimating covariance
fit0 <- bivnormfit(Y, X, covariance=FALSE)
fit1 <- bivnormfit(Y, X, covariance=TRUE)
## likelihood-ratio test
2*(fit0$loglik - fit1$loglik)
pchisq(54.24, 1, lower=FALSE)

## function for extracting diagnostics (raw residuals)
dfun <- function(obj) {
  r <- obj$resid
  n <- obj$n
  return(list(r[1:n], r[(n+1):(2*n)]))
}

## function for simulating new response variables
sfun <- function(obj) {
  n <- obj$n
  fitted <- obj$fitted
  sig1 <- obj$coefs[5]
  sig2 <- obj$coefs[6]
  if(obj$covariance) sig12 <- obj$coefs[7] else sig12 <- 0
  Sig1 <- diag(rep(sig1), n)
  Sig2 <- diag(rep(sig2), n)
  Sig12 <- diag(rep(sig12), n)
  V <- rbind(cbind(Sig1, Sig12),
             cbind(Sig12, Sig2))
  Y <- as.numeric(rmvnorm(1, c(mu1, mu2), V))
  return(list(Y[1:n], Y[(n+1):(2*n)], "X" = obj$X, 
              "covariance" = obj$covariance))
}

## function for refitting the model to simulated data
ffun <- function(new.obj) {
  Ynew <- c(new.obj[[1]], new.obj[[2]])
  bivnormfit(Ynew, new.obj$X, new.obj$covariance)
}

## Bivariate residual plot for model 1 (without estimating covariance)
plot1 <- bivrp(fit0, diagfun=dfun, simfun=sfun, fitfun=ffun, verb=TRUE)
## without polygon area reduction
plot(plot1, conf=1)
## drawing polygons
plot(plot1, add.polygon=TRUE)
## without ordering
plot(plot1, theta.sort=FALSE, kernel=TRUE, add.dplots=TRUE, superpose=TRUE)

## Bivariate residual plot for model 2 (estimating covariance)
plot2 <- bivrp(fit1, diagfun=dfun, simfun=sfun, fitfun=ffun, verb=TRUE)
## without polygon area reduction
plot(plot2, conf=1)
## drawing polygons
plot(plot2, add.polygon=TRUE, conf=1)
## without ordering
plot(plot2, theta.sort=FALSE, kernel=TRUE, add.dplots=TRUE, superpose=TRUE)



