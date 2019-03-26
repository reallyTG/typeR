library(hSDM)


### Name: hSDM.poisson
### Title: Poisson log regression model
### Aliases: hSDM.poisson
### Keywords: Poisson regression biodiversity species distribution models
###   hierarchical Bayesian models MCMC Markov Chains Monte Carlo
###   Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.poisson()
##D # Example with simulated data
##D #==============================================
##D 
##D #=================
##D #== Load libraries
##D library(hSDM)
##D 
##D #==================
##D #== Data simulation
##D 
##D #= Number of sites
##D nsite <- 200
##D 
##D #= Set seed for repeatability
##D seed <- 1234
##D 
##D #= Ecological process (suitability)
##D set.seed(seed)
##D x1 <- rnorm(nsite,0,1)
##D set.seed(2*seed)
##D x2 <- rnorm(nsite,0,1)
##D X <- cbind(rep(1,nsite),x1,x2)
##D beta.target <- c(-1,1,-1)
##D log.lambda <- X %*% beta.target
##D lambda <- exp(log.lambda)
##D set.seed(seed)
##D Y <- rpois(nsite,lambda)
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,x1,x2)
##D 
##D #==================================
##D #== Site-occupancy model
##D 
##D mod.hSDM.poisson <- hSDM.poisson(counts=data.obs$Y,
##D                                  suitability=~x1+x2,
##D                                  data=data.obs,
##D                                  suitability.pred=NULL,
##D                                  burnin=1000, mcmc=1000, thin=1,
##D                                  beta.start=0,
##D                                  mubeta=0, Vbeta=1.0E6,
##D                                  seed=1234, verbose=1,
##D                                  save.p=0)
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates
##D summary(mod.hSDM.poisson$mcmc)
##D pdf(file="Posteriors_hSDM.poisson.pdf")
##D plot(mod.hSDM.poisson$mcmc)
##D dev.off()
##D 
##D #== glm resolution to compare
##D mod.glm <- glm(Y~x1+x2,family="poisson",data=data.obs)
##D summary(mod.glm)
##D 
##D #= Predictions
##D summary(mod.hSDM.poisson$lambda.latent)
##D summary(mod.hSDM.poisson$lambda.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(lambda,mod.hSDM.poisson$lambda.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
## End(Not run)




