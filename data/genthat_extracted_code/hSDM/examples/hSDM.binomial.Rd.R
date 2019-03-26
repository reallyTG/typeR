library(hSDM)


### Name: hSDM.binomial
### Title: Binomial logistic regression model
### Aliases: hSDM.binomial
### Keywords: Binomial logistic regression biodiversity species
###   distribution models hierarchical Bayesian models MCMC Markov Chains
###   Monte Carlo Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.binomial()
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
##D #= Number of visits associated to each site
##D set.seed(seed)
##D visits<- rpois(nsite,3)
##D visits[visits==0] <- 1
##D 
##D #= Ecological process (suitability)
##D set.seed(seed)
##D x1 <- rnorm(nsite,0,1)
##D set.seed(2*seed)
##D x2 <- rnorm(nsite,0,1)
##D X <- cbind(rep(1,nsite),x1,x2)
##D beta.target <- c(-1,1,-1)
##D logit.theta <- X %*% beta.target
##D theta <- inv.logit(logit.theta)
##D set.seed(seed)
##D Y <- rbinom(nsite,visits,theta)
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,visits,x1,x2)
##D 
##D #==================================
##D #== Site-occupancy model
##D 
##D mod.hSDM.binomial <- hSDM.binomial(presences=data.obs$Y,
##D                                    trials=data.obs$visits,
##D                                    suitability=~x1+x2,
##D                                    data=data.obs,
##D                                    suitability.pred=NULL,
##D                                    burnin=1000, mcmc=1000, thin=1,
##D                                    beta.start=0,
##D                                    mubeta=0, Vbeta=1.0E6,
##D                                    seed=1234, verbose=1,
##D                                    save.p=0)
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates
##D summary(mod.hSDM.binomial$mcmc)
##D pdf(file="Posteriors_hSDM.binomial.pdf")
##D plot(mod.hSDM.binomial$mcmc)
##D dev.off()
##D 
##D #== glm resolution to compare
##D mod.glm <- glm(cbind(Y,visits-Y)~x1+x2,family="binomial",data=data.obs)
##D summary(mod.glm)
##D 
##D #= Predictions
##D summary(mod.hSDM.binomial$theta.latent)
##D summary(mod.hSDM.binomial$theta.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(theta,mod.hSDM.binomial$theta.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
## End(Not run)




