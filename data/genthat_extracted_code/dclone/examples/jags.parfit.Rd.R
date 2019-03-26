library(dclone)


### Name: jags.parfit
### Title: Parallel computing with JAGS
### Aliases: jags.parfit
### Keywords: models

### ** Examples

## Not run: 
##D if (require(rjags)) {
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
##D load.module("glm")
##D m <- jags.fit(dat, "beta", glm.model)
##D cl <- makePSOCKcluster(3)
##D ## load glm module
##D tmp <- clusterEvalQ(cl, library(dclone))
##D parLoadModule(cl, "glm")
##D pm <- jags.parfit(cl, dat, "beta", glm.model)
##D ## chains are not identical -- this is good
##D pm[1:2,]
##D summary(pm)
##D ## examples on how to use initial values
##D ## fixed initial values
##D inits <- list(list(beta=matrix(c(0,1),1,2)),
##D     list(beta=matrix(c(1,0),1,2)),
##D     list(beta=matrix(c(0,0),1,2)))
##D pm2 <- jags.parfit(cl, dat, "beta", glm.model, inits)
##D ## random numbers generated prior to jags.parfit
##D inits <- list(list(beta=matrix(rnorm(2),1,2)),
##D     list(beta=matrix(rnorm(2),1,2)),
##D     list(beta=matrix(rnorm(2),1,2)))
##D pm3 <- jags.parfit(cl, dat, "beta", glm.model, inits)
##D ## self contained function
##D inits <- function() list(beta=matrix(rnorm(2),1,2))
##D pm4 <- jags.parfit(cl, dat, "beta", glm.model, inits)
##D ## function pointing to the global environment
##D fun <- function() list(beta=matrix(rnorm(2),1,2))
##D inits <- function() fun()
##D clusterExport(cl, "fun")
##D ## using the L'Ecuyer module with 6 chains
##D load.module("lecuyer")
##D parLoadModule(cl,"lecuyer")
##D pm5 <- jags.parfit(cl, dat, "beta", glm.model, inits,
##D     n.chains=6)
##D nchain(pm5)
##D unload.module("lecuyer")
##D parUnloadModule(cl,"lecuyer")
##D stopCluster(cl)
##D ## multicore type forking
##D if (.Platform$OS.type != "windows") {
##D pm6 <- jags.parfit(3, dat, "beta", glm.model)
##D }
##D }
## End(Not run)



