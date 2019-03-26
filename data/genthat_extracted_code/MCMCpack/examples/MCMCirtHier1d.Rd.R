library(MCMCpack)


### Name: MCMCirtHier1d
### Title: Markov Chain Monte Carlo for Hierarchical One Dimensional Item
###   Response Theory Model, Covariates Predicting Latent Ideal Point
###   (Ability)
### Aliases: MCMCirtHier1d
### Keywords: models

### ** Examples


   ## Not run: 
##D data(SupremeCourt)
##D 
##D Xjdata <- data.frame(presparty= c(1,1,0,1,1,1,1,0,0),
##D                      sex= c(0,0,1,0,0,0,0,1,0))
##D 
##D ## Parameter Expansion reduces autocorrelation.
##D   posterior1 <- MCMCirtHier1d(t(SupremeCourt),
##D                    burnin=50000, mcmc=10000, thin=20,
##D                    verbose=10000,
##D                    Xjdata=Xjdata,
##D                    marginal.likelihood="Chib95",
##D 		   px=TRUE)
##D 
##D ## But, you can always turn it off.
##D   posterior2 <- MCMCirtHier1d(t(SupremeCourt),
##D                    burnin=50000, mcmc=10000, thin=20,
##D                    verbose=10000,
##D                    Xjdata=Xjdata,
##D                    #marginal.likelihood="Chib95",
##D 		   px=FALSE)
##D ## Note that the hierarchical model has greater autocorrelation than
##D ## the naive IRT model.
##D   posterior0 <- MCMCirt1d(t(SupremeCourt),
##D                         theta.constraints=list(Scalia="+", Ginsburg="-"),
##D                         B0.alpha=.2, B0.beta=.2,
##D                         burnin=50000, mcmc=100000, thin=100, verbose=10000,
##D                         store.item=FALSE)
##D 
##D ## Randomly 10% Missing -- this affects the expansion parameter, increasing
##D ## the variance of the (unidentified) latent parameter alpha.
##D 
##D    scMiss <- SupremeCourt
##D    scMiss[matrix(as.logical(rbinom(nrow(SupremeCourt)*ncol(SupremeCourt), 1, .1)),
##D       dim(SupremeCourt))] <- NA
##D 
##D    posterior1.miss <- MCMCirtHier1d(t(scMiss),
##D                    burnin=80000, mcmc=10000, thin=20,
##D                    verbose=10000,
##D                    Xjdata=Xjdata,
##D                    marginal.likelihood="Chib95",
##D 		   px=TRUE)
##D 
##D    
## End(Not run)




