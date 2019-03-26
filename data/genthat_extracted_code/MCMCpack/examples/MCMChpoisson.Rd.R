library(MCMCpack)


### Name: MCMChpoisson
### Title: Markov Chain Monte Carlo for the Hierarchical Poisson Linear
###   Regression Model using the log link function
### Aliases: MCMChpoisson
### Keywords: MCMC Poisson bayesian glmm hierarchical mixed models

### ** Examples


## Not run: 
##D #========================================
##D # Hierarchical Poisson Linear Regression
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
##D X1 <- runif(n=nobs,min=-1,max=1)
##D X2 <- runif(n=nobs,min=-1,max=1)
##D X <- cbind(rep(1,nobs),X1,X2)
##D W <- X
##D 
##D # Target parameters
##D # beta
##D beta.target <- matrix(c(0.1,0.1,0.1),ncol=1)
##D # Vb
##D Vb.target <- c(0.05,0.05,0.05)
##D # b
##D b.target <- cbind(rnorm(nspecies,mean=0,sd=sqrt(Vb.target[1])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[2])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[3])))
##D 
##D # Response
##D lambda <- vector()
##D Y <- vector()
##D for (n in 1:nobs) {
##D   lambda[n] <- exp(X[n,]%*%beta.target+W[n,]%*%b.target[species[n],])
##D   Y[n] <- rpois(1,lambda[n])
##D }
##D 
##D # Data-set
##D Data <- as.data.frame(cbind(Y,lambda,X1,X2,species))
##D plot(Data$X1,Data$lambda)
##D 
##D #== Call to MCMChpoisson
##D model <- MCMChpoisson(fixed=Y~X1+X2, random=~X1+X2, group="species",
##D               data=Data, burnin=5000, mcmc=1000, thin=1,verbose=1,
##D               seed=NA, beta.start=0, sigma2.start=1,
##D               Vb.start=1, mubeta=0, Vbeta=1.0E6,
##D               r=3, R=diag(c(0.1,0.1,0.1)), nu=0.001, delta=0.001, FixOD=1)
##D 
##D #== MCMC analysis
##D 
##D # Graphics
##D pdf("Posteriors-MCMChpoisson.pdf")
##D plot(model$mcmc)
##D dev.off()
##D 
##D # Summary
##D summary(model$mcmc)
##D 
##D # Predictive posterior mean for each observation
##D model$lambda.pred
##D 
##D # Predicted-Observed
##D plot(Data$lambda,model$lambda.pred)
##D abline(a=0,b=1)
##D 
##D ## #Not run
##D ## #You can also compare with lme4 results
##D ## #== lme4 resolution
##D ## library(lme4)
##D ## model.lme4 <- lmer(Y~X1+X2+(1+X1+X2|species),data=Data,family="poisson")
##D ## summary(model.lme4)
##D ## plot(fitted(model.lme4),model$lambda.pred,main="MCMChpoisson/lme4")
##D ## abline(a=0,b=1)
## End(Not run)




