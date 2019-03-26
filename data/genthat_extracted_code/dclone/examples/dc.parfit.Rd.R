library(dclone)


### Name: dc.parfit
### Title: Parallel model fitting with data cloning
### Aliases: dc.parfit
### Keywords: models htest

### ** Examples

## Not run: 
##D set.seed(1234)
##D n <- 20
##D x <- runif(n, -1, 1)
##D X <- model.matrix(~x)
##D beta <- c(2, -1)
##D mu <- crossprod(t(X), beta)
##D Y <- rpois(n, exp(mu))
##D glm.model <- function() {
##D     for (i in 1:n) {
##D         Y[i] ~ dpois(lambda[i])
##D         log(lambda[i]) <- inprod(X[i,], beta[1,])
##D     }
##D     for (j in 1:np) {
##D         beta[1,j] ~ dnorm(0, 0.001)
##D     }
##D }
##D dat <- list(Y=Y, X=X, n=n, np=ncol(X))
##D k <- 1:3
##D ## sequential version
##D dcm <- dc.fit(dat, "beta", glm.model, n.clones=k, multiply="n",
##D     unchanged="np")
##D ## parallel version
##D cl <- makePSOCKcluster(3)
##D pdcm1 <- dc.parfit(cl, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="balancing")
##D pdcm2 <- dc.parfit(cl, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="parchains")
##D pdcm3 <- dc.parfit(cl, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="both")
##D summary(dcm)
##D summary(pdcm1)
##D summary(pdcm2)
##D summary(pdcm3)
##D stopCluster(cl)
##D ## multicore type forking
##D if (.Platform$OS.type != "windows") {
##D mcdcm1 <- dc.parfit(3, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="balancing")
##D mcdcm2 <- dc.parfit(3, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="parchains")
##D mcdcm3 <- dc.parfit(3, dat, "beta", glm.model, n.clones=k,
##D     multiply="n", unchanged="np",
##D     partype="both")
##D }
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
##D cl <- makePSOCKcluster(2)
##D if (.Platform$OS.type == "windows") {
##D sim2 <- dc.parfit(cl, dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="WinBUGS", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim2)
##D }
##D sim3 <- dc.parfit(cl, dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="brugs", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim3)
##D library(R2OpenBUGS)
##D sim4 <- dc.parfit(cl, dat, param, bugs.model, n.clones=1:2,
##D     flavour="bugs", program="openbugs", multiply="J",
##D     n.iter=2000, n.thin=1)
##D summary(sim4)
##D stopCluster(cl)
##D 
##D ## simulation for Poisson GLMM with inits
##D set.seed(1234)
##D n <- 5
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
##D ## model arg is necessary as 1st arg,
##D ## but not used when partype!=parchains
##D ifun <-
##D function(model, n.clones) {
##D     list(alpha=dclone(rep(0,n), n.clones),
##D         beta=c(0,0))
##D }
##D ## make cluster
##D cl <- makePSOCKcluster(2)
##D ## pass global n variable used in ifun to workers
##D tmp <- clusterExport(cl, "n")
##D ## fit the model
##D jmod2 <- dc.parfit(cl, jdata, c("beta", "sigma"), jfun1, ini,
##D     n.clones = 1:2, multiply = "n", unchanged = "np",
##D     initsfun=ifun, partype="balancing")
##D stopCluster(cl)
## End(Not run)



