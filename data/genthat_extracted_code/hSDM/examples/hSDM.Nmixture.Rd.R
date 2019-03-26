library(hSDM)


### Name: hSDM.Nmixture
### Title: N-mixture model
### Aliases: hSDM.Nmixture
### Keywords: biodiversity species distribution models hierarchical
###   Bayesian models N-mixture models MCMC Markov Chains Monte Carlo
###   Metropolis algorithm

### ** Examples


## Not run: 
##D 
##D #==============================================
##D # hSDM.Nmixture()
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
##D # Number of observation sites
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
##D log.lambda <- X %*% beta.target
##D lambda <- exp(log.lambda)
##D set.seed(seed)
##D N <- rpois(nsite,lambda)
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
##D Y <- rbinom(nobs,N[sites],delta)
##D 
##D #= Data-sets
##D data.obs <- data.frame(Y,w1,w2,site=sites)
##D data.suit <- data.frame(x1,x2)
##D 
##D #================================
##D #== Parameter inference with hSDM
##D 
##D Start <- Sys.time() # Start the clock
##D mod.hSDM.Nmixture <- hSDM.Nmixture(# Observations
##D                            counts=data.obs$Y,
##D                            observability=~w1+w2,
##D                            site=data.obs$site,
##D                            data.observability=data.obs,
##D                            # Habitat
##D                            suitability=~x1+x2,
##D                            data.suitability=data.suit,
##D                            # Predictions
##D                            suitability.pred=NULL,
##D                            # Chains
##D                            burnin=5000, mcmc=5000, thin=5,
##D                            # Starting values
##D                            beta.start=0,
##D                            gamma.start=0,
##D                            # Priors
##D                            mubeta=0, Vbeta=1.0E6,
##D                            mugamma=0, Vgamma=1.0E6,
##D                            # Various
##D                            seed=1234, verbose=1,
##D                            save.p=0, save.N=1)
##D Time.hSDM <- difftime(Sys.time(),Start,units="sec") # Time difference
##D 
##D #= Computation time
##D Time.hSDM
##D 
##D #==========
##D #== Outputs
##D 
##D #= Parameter estimates
##D summary(mod.hSDM.Nmixture$mcmc)
##D pdf(file="Posteriors_hSDM.Nmixture.pdf")
##D plot(mod.hSDM.Nmixture$mcmc)
##D dev.off()
##D 
##D #= Predictions
##D summary(mod.hSDM.Nmixture$lambda.latent)
##D summary(mod.hSDM.Nmixture$delta.latent)
##D summary(mod.hSDM.Nmixture$lambda.pred)
##D pdf(file="Pred-Init.pdf")
##D plot(lambda,mod.hSDM.Nmixture$lambda.pred)
##D abline(a=0,b=1,col="red")
##D dev.off()
##D 
##D #= MCMC for latent variable N
##D pdf(file="MCMC_N.pdf")
##D plot(mod.hSDM.Nmixture$N.pred)
##D dev.off()
##D 
##D #= Check that Ns are correctly estimated
##D M <- as.matrix(mod.hSDM.Nmixture$N.pred)
##D N.est <- apply(M,2,mean)
##D Y.by.site <- tapply(data.obs$Y,data.obs$site,mean) # Mean by site
##D pdf(file="Check_N.pdf",width=10,height=5)
##D par(mfrow=c(1,2))
##D plot(Y.by.site, N.est) ## More individuals are expected (N > Y) due to detection process
##D abline(a=0,b=1,col="red")
##D plot(N, N.est) ## N are well estimated
##D abline(a=0,b=1,col="red")
##D cor(N, N.est) ## Very close to 1
##D dev.off()
##D 
## End(Not run)




