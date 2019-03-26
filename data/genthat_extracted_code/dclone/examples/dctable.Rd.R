library(dclone)


### Name: dctable
### Title: Retrieve descriptive statistics from fitted objects to evaluate
###   convergence
### Aliases: dctable dctable.default extractdctable extractdctable.default
###   plot.dctable dcdiag dcdiag.default extractdcdiag
###   extractdcdiag.default plot.dcdiag
### Keywords: models htest

### ** Examples

## Not run: 
##D ## simulation for Poisson GLMM
##D set.seed(1234)
##D n <- 20
##D beta <- c(2, -1)
##D sigma <- 0.1
##D alpha <- rnorm(n, 0, sigma)
##D x <- runif(n)
##D X <- model.matrix(~x)
##D linpred <- crossprod(t(X), beta) + alpha
##D Y <- rpois(n, exp(linpred))
##D ## JAGS model as a function
##D jfun1 <- function() {
##D     for (i in 1:n) {
##D         Y[i] ~ dpois(lambda[i])
##D         log(lambda[i]) <- alpha[i] + inprod(X[i,], beta[1,])
##D         alpha[i] ~ dnorm(0, 1/sigma^2)
##D     }
##D     for (j in 1:np) {
##D         beta[1,j] ~ dnorm(0, 0.001)
##D     }
##D     sigma ~ dlnorm(0, 0.001)
##D }
##D ## data
##D jdata <- list(n = n, Y = Y, X = X, np = NCOL(X))
##D ## number of clones to be used, etc.
##D ## iteartive fitting
##D jmod <- dc.fit(jdata, c("beta", "sigma"), jfun1,
##D     n.clones = 1:5, multiply = "n", unchanged = "np")
##D ## summary with DC SE and R hat
##D summary(jmod)
##D dct <- dctable(jmod)
##D plot(dct)
##D ## How to use estimates to make priors more informative?
##D glmm.model.up <- function() {
##D     for (i in 1:n) {
##D         Y[i] ~ dpois(lambda[i])
##D         log(lambda[i]) <- alpha[i] + inprod(X[i,], beta[1,])
##D         alpha[i] ~ dnorm(0, 1/sigma^2)
##D     }
##D     for (j in 1:p) {
##D         beta[1,j] ~ dnorm(priors[j,1], priors[j,2])
##D     }
##D     sigma ~ dgamma(priors[(p+1),2], priors[(p+1),1])
##D }
##D ## function for updating, x is an MCMC object
##D upfun <- function(x) {
##D     if (missing(x)) {
##D         p <- ncol(X)
##D         return(cbind(c(rep(0, p), 0.001), rep(0.001, p+1)))
##D     } else {
##D         par <- coef(x)
##D         return(cbind(par, rep(0.01, length(par))))
##D     }
##D }
##D updat <- list(n = n, Y = Y, X = X, p = ncol(X), priors = upfun())
##D dcmod <- dc.fit(updat, c("beta", "sigma"), glmm.model.up,
##D     n.clones = 1:5, multiply = "n", unchanged = "p",
##D     update = "priors", updatefun = upfun)
##D summary(dcmod)
##D dct <- dctable(dcmod)
##D plot(dct)
##D plot(dct, type = "var")
## End(Not run)



