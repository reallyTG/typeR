library(dclone)


### Name: dc.fit
### Title: Iterative model fitting with data cloning
### Aliases: dc.fit
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
##D         log(lambda[i]) <- alpha[i] + inprod(X[i,], beta)
##D         alpha[i] ~ dnorm(0, 1/sigma^2)
##D     }
##D     for (j in 1:np) {
##D         beta[j] ~ dnorm(0, 0.001)
##D     }
##D     sigma ~ dlnorm(0, 0.001)
##D }
##D ## data
##D jdata <- list(n = n, Y = Y, X = X, np = NCOL(X))
##D ## inits with latent variable and parameters
##D ini <- list(alpha=rep(0,n), beta=rep(0, NCOL(X)))
##D ## function to update inits
##D ifun <- function(model, n.clones) {
##D     list(alpha=dclone(rep(0,n), n.clones),
##D         beta=coef(model)[-length(coef(model))])
##D }
##D ## iteartive fitting
##D jmod <- dc.fit(jdata, c("beta", "sigma"), jfun1, ini,
##D     n.clones = 1:5, multiply = "n", unchanged = "np",
##D     initsfun=ifun)
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
##D ## time series example
##D ## data and model taken from Ponciano et al. 2009
##D ## Ecology 90, 356-362.
##D paurelia <- c(17,29,39,63,185,258,267,392,510,
##D     570,650,560,575,650,550,480,520,500)
##D dat <- list(ncl=1, n=length(paurelia), Y=dcdim(data.matrix(paurelia)))
##D beverton.holt <- function() {
##D     for (k in 1:ncl) {
##D         for(i in 2:(n+1)){
##D             ## observations
##D             Y[(i-1), k] ~ dpois(exp(X[i, k]))
##D             ## state
##D             X[i, k] ~ dnorm(mu[i, k], 1 / sigma^2)
##D             mu[i, k] <- X[(i-1), k] + log(lambda) - log(1 + beta * exp(X[(i-1), k]))
##D         }
##D         ## state at t0
##D         X[1, k] ~ dnorm(mu0, 1 / sigma^2)
##D     }
##D     # Priors on model parameters
##D     beta ~ dlnorm(-1, 1)
##D     sigma ~ dlnorm(0, 1)
##D     tmp ~ dlnorm(0, 1)
##D     lambda <- tmp + 1
##D     mu0 <- log(2)  + log(lambda) - log(1 + beta * 2)
##D }
##D mod <- dc.fit(dat, c("lambda","beta","sigma"), beverton.holt,
##D     n.clones=c(1, 2, 5, 10), multiply="ncl", unchanged="n")
##D ## compare with results from the paper:
##D ##   beta   = 0.00235
##D ##   lambda = 2.274
##D ##   sigma  = 0.1274
##D summary(mod)
##D 
##D ## Using WinBUGS/OpenBUGS
##D library(R2WinBUGS)
##D data(schools)
##D dat <- list(J = nrow(schools), y = schools$estimate,
##D     sigma.y = schools$sd)
##D bugs.model <- function(){
##D        for (j in 1:J){
##D          y[j] ~ dnorm (theta[j], tau.y[j])
##D          theta[j] ~ dnorm (mu.theta, tau.theta)
##D          tau.y[j] <- pow(sigma.y[j], -2)
##D        }
##D        mu.theta ~ dnorm (0.0, 1.0E-6)
##D        tau.theta <- pow(sigma.theta, -2)
##D        sigma.theta ~ dunif (0, 1000)
##D      }
##D inits <- function(){
##D     list(theta=rnorm(nrow(schools), 0, 100), mu.theta=rnorm(1, 0, 100),
##D          sigma.theta=runif(1, 0, 100))
##D }
##D param <- c("mu.theta", "sigma.theta")
##D if (.Platform$OS.type == "windows") {
##D sim2 <- dc.fit(dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="WinBUGS", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim2)
##D }
##D sim3 <- dc.fit(dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="brugs", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim3)
##D library(R2OpenBUGS)
##D sim4 <- dc.fit(dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="openbugs", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim4)
## End(Not run)



