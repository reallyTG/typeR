library(MCMCpack)


### Name: MCMChregress
### Title: Markov Chain Monte Carlo for the Hierarchical Gaussian Linear
###   Regression Model
### Aliases: MCMChregress
### Keywords: Gaussian MCMC bayesian hierarchical mixed models

### ** Examples


## Not run: 
##D #========================================
##D # Hierarchical Gaussian Linear Regression
##D #========================================
##D 
##D #== Generating data
##D 
##D # Constants
##D nobs <- 1000
##D nspecies <- 20
##D species <- c(1:nspecies,sample(c(1:nspecies),(nobs-nspecies),replace=TRUE))
##D 
##D # Covariates
##D X1 <- runif(n=nobs,min=0,max=10)
##D X2 <- runif(n=nobs,min=0,max=10)
##D X <- cbind(rep(1,nobs),X1,X2)
##D W <- X
##D 
##D # Target parameters
##D # beta
##D beta.target <- matrix(c(0.1,0.3,0.2),ncol=1)
##D # Vb
##D Vb.target <- c(0.5,0.2,0.1)
##D # b
##D b.target <- cbind(rnorm(nspecies,mean=0,sd=sqrt(Vb.target[1])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[2])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[3])))
##D # sigma2
##D sigma2.target <- 0.02
##D 
##D # Response
##D Y <- vector()
##D for (n in 1:nobs) {
##D   Y[n] <- rnorm(n=1,
##D                 mean=X[n,]%*%beta.target+W[n,]%*%b.target[species[n],],
##D                 sd=sqrt(sigma2.target))
##D }
##D 
##D # Data-set
##D Data <- as.data.frame(cbind(Y,X1,X2,species))
##D plot(Data$X1,Data$Y)
##D 
##D #== Call to MCMChregress
##D model <- MCMChregress(fixed=Y~X1+X2, random=~X1+X2, group="species",
##D               data=Data, burnin=1000, mcmc=1000, thin=1,verbose=1,
##D               seed=NA, beta.start=0, sigma2.start=1,
##D               Vb.start=1, mubeta=0, Vbeta=1.0E6,
##D               r=3, R=diag(c(1,0.1,0.1)), nu=0.001, delta=0.001)
##D 
##D #== MCMC analysis
##D 
##D # Graphics
##D pdf("Posteriors-MCMChregress.pdf")
##D plot(model$mcmc)
##D dev.off()
##D 
##D # Summary
##D summary(model$mcmc)
##D 
##D # Predictive posterior mean for each observation
##D model$Y.pred
##D 
##D # Predicted-Observed
##D plot(Data$Y,model$Y.pred)
##D abline(a=0,b=1)
## End(Not run)




