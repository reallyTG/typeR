library(hSDM)


### Name: hSDM.ZIB
### Title: ZIB (Zero-Inflated Binomial) model
### Aliases: hSDM.ZIB
### Keywords: biodiversity species distribution models hierarchical
###   Bayesian models MCMC Markov Chains Monte Carlo Metropolis algorithm
###   ZIB models Zero-Inflated Binomial models

### ** Examples


## Not run: 
##D  
##D 
##D #==============================================
##D # hSDM.ZIB()
##D # Example with simulated data
##D #==============================================
##D 
##D #============
##D #== Preambule
##D library(hSDM)
##D 
##D #==================
##D #== Data simulation
##D 
##D # Set seed for repeatability
##D seed <- 1234
##D 
##D # Number of observations
##D nobs <- 1000
##D 
##D # Target parameters
##D beta.target <- matrix(c(0.2,0.5,0.5),ncol=1)
##D gamma.target <- matrix(c(1),ncol=1)
##D ## Uncomment if you want covariates on the observability process
##D ## gamma.target <- matrix(c(0.2,0.5,0.5),ncol=1)
##D 
##D # Covariates for "suitability" process
##D set.seed(seed)
##D X1 <- rnorm(n=nobs,0,1)
##D set.seed(2*seed)
##D X2 <- rnorm(n=nobs,0,1)
##D X <- cbind(rep(1,nobs),X1,X2)
##D 
##D # Covariates for "observability" process
##D W <- cbind(rep(1,nobs))
##D ## Uncomment if you want covariates on the observability process 
##D ## set.seed(3*seed)
##D ## W1 <- rnorm(n=nobs,0,1)
##D ## set.seed(4*seed)
##D ## W2 <- rnorm(n=nobs,0,1)
##D ## W <- cbind(rep(1,nobs),W1,W2)
##D 
##D #== Simulating latent variables
##D 
##D # Suitability
##D logit.theta.1 <- X %*% beta.target
##D theta.1 <- inv.logit(logit.theta.1)
##D set.seed(seed)
##D y.1 <- rbinom(nobs,1,theta.1)
##D 
##D # Observability
##D set.seed(seed)
##D trials <- rpois(nobs,5)	# Number of trial associated to each observation
##D trials[trials==0] <- 1
##D logit.theta.2 <- W %*% gamma.target
##D theta.2 <- inv.logit(logit.theta.2)
##D set.seed(seed)
##D y.2 <- rbinom(nobs,trials,theta.2)
##D 
##D #== Simulating response variable
##D Y <- y.2*y.1
##D 
##D #== Data-set
##D Data <- data.frame(Y,trials,X1,X2)
##D ## Uncomment if you want covariates on the observability process 
##D ## Data <- data.frame(Y,trials,X1,X2,W1,W2)
##D 
##D #==================================
##D #== ZIB model
##D 
##D mod.hSDM.ZIB <- hSDM.ZIB(presences=Data$Y,
##D                          trials=Data$trials,
##D                          suitability=~X1+X2,
##D                          observability=~1, #=~1+W1+W2 if covariates
##D                          data=Data,
##D                          suitability.pred=NULL,
##D                          burnin=1000, mcmc=1000, thin=5,
##D                          beta.start=0,
##D                          gamma.start=0,
##D                          mubeta=0, Vbeta=1.0E6,
##D                          mugamma=0, Vgamma=1.0E6,
##D                          seed=1234, verbose=1,
##D                          save.p=0)
##D 
##D #==========
##D #== Outputs
##D pdf(file="Posteriors_hSDM.ZIB.pdf")
##D plot(mod.hSDM.ZIB$mcmc)
##D dev.off()
##D summary(mod.hSDM.ZIB$prob.p.latent)
##D summary(mod.hSDM.ZIB$prob.q.latent)
##D summary(mod.hSDM.ZIB$prob.p.pred)
##D 
## End(Not run)




