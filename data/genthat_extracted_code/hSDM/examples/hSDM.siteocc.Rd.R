library(hSDM)


### Name: hSDM.siteocc
### Title: Site occupancy model
### Aliases: hSDM.siteocc
### Keywords: biodiversity species distribution models site-occupancy
###   models hierarchical Bayesian models MCMC Markov Chains Monte Carlo
###   Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.siteocc()
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
##D #= Number of observation sites
##D nsite <- 200
##D 
##D #= Set seed for repeatability
##D seed <- 4321
##D 
##D #= Ecological process (suitability)
##D set.seed(seed)
##D x1 <- rnorm(nsite,0,1)
##D set.seed(2*seed)
##D x2 <- rnorm(nsite,0,1)
##D X <- cbind(rep(1,nsite),x1,x2)
##D beta.target <- c(-1,1,-1) # Target parameters
##D logit.theta <- X %*% beta.target
##D theta <- inv.logit(logit.theta)
##D set.seed(seed)
##D Z <- rbinom(nsite,1,theta)
##D 
##D #= Number of visits associated to each observation point
##D set.seed(seed)
##D visits <- rpois(nsite,3)
##D visits[visits==0] <- 1
##D # Vector of observation points
##D sites <- vector()
##D for (i in 1:nsite) {
##D     sites <- c(sites,rep(i,visits[i]))
##D }
##D 
##D #= Observation process (detectability)
##D nobs <- sum(visits)
##D set.seed(seed)
##D w1 <- rnorm(nobs,0,1)
##D set.seed(2*seed)
##D w2 <- rnorm(nobs,0,1)
##D W <- cbind(rep(1,nobs),w1,w2)
##D gamma.target <- c(-1,1,-1) # Target parameters
##D logit.delta <- W %*% gamma.target
##D delta <- inv.logit(logit.delta)
##D set.seed(seed)
##D Y <- rbinom(nobs,1,delta*Z[sites])
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,w1,w2,site=sites)
##D data.suit <- data.frame(x1,x2)
##D 
##D #================================
##D #== Parameter inference with hSDM
##D #==================================
##D 
##D Start <- Sys.time() # Start the clock
##D mod.hSDM.siteocc <- hSDM.siteocc(# Observations
##D                                  presence=data.obs$Y,
##D                                  observability=~w1+w2,
##D                                  site=data.obs$site,
##D                                  data.observability=data.obs,
##D                                  # Habitat
##D                                  suitability=~x1+x2,
##D                                  data.suitability=data.suit,
##D                                  # Predictions
##D                                  suitability.pred=NULL,
##D                                  # Chains
##D                                  burnin=2000, mcmc=2000, thin=2,
##D                                  # Starting values
##D                                  beta.start=0,
##D                                  gamma.start=0,
##D                                  # Priors
##D                                  mubeta=0, Vbeta=1.0E6,
##D                                  mugamma=0, Vgamma=1.0E6,
##D                                  # Various
##D                                  seed=1234, verbose=1, save.p=0)
##D Time.hSDM <- difftime(Sys.time(),Start,units="sec") # Time difference
##D 
##D #= Computation time
##D Time.hSDM
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates
##D summary(mod.hSDM.siteocc$mcmc)
##D pdf(file="Posteriors_hSDM.siteocc.pdf")
##D plot(mod.hSDM.siteocc$mcmc)
##D dev.off()
##D 
##D #= Predictions
##D summary(mod.hSDM.siteocc$theta.latent)
##D summary(mod.hSDM.siteocc$delta.latent)
##D summary(mod.hSDM.siteocc$theta.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(theta,mod.hSDM.siteocc$theta.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
## End(Not run)




