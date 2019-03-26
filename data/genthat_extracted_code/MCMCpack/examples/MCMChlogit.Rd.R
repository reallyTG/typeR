library(MCMCpack)


### Name: MCMChlogit
### Title: Markov Chain Monte Carlo for the Hierarchical Binomial Linear
###   Regression Model using the logit link function
### Aliases: MCMChlogit
### Keywords: Binomial MCMC bayesian glmm hierarchical logit mixed models

### ** Examples


## Not run: 
##D #========================================
##D # Hierarchical Binomial Linear Regression
##D #========================================
##D 
##D #== inv.logit function
##D inv.logit <- function(x, min=0, max=1) {
##D     p <- exp(x)/(1+exp(x))
##D     p <- ifelse( is.na(p) & !is.na(x), 1, p ) # fix problems with +Inf
##D     return(p*(max-min)+min)
##D }
##D 
##D #== Generating data
##D 
##D # Constants
##D nobs <- 1000
##D nspecies <- 20
##D species <- c(1:nspecies,sample(c(1:nspecies),(nobs-nspecies),replace=TRUE))
##D 
##D # Covariates
##D X1 <- runif(n=nobs,min=-10,max=10)
##D X2 <- runif(n=nobs,min=-10,max=10)
##D X <- cbind(rep(1,nobs),X1,X2)
##D W <- X
##D 
##D # Target parameters
##D # beta
##D beta.target <- matrix(c(0.3,0.2,0.1),ncol=1)
##D # Vb
##D Vb.target <- c(0.5,0.05,0.05)
##D # b
##D b.target <- cbind(rnorm(nspecies,mean=0,sd=sqrt(Vb.target[1])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[2])),
##D                   rnorm(nspecies,mean=0,sd=sqrt(Vb.target[3])))
##D 
##D # Response
##D theta <- vector()
##D Y <- vector()
##D for (n in 1:nobs) {
##D   theta[n] <- inv.logit(X[n,]%*%beta.target+W[n,]%*%b.target[species[n],])
##D   Y[n] <- rbinom(n=1,size=1,prob=theta[n])
##D }
##D 
##D # Data-set
##D Data <- as.data.frame(cbind(Y,theta,X1,X2,species))
##D plot(Data$X1,Data$theta)
##D 
##D #== Call to MCMChlogit
##D model <- MCMChlogit(fixed=Y~X1+X2, random=~X1+X2, group="species",
##D               data=Data, burnin=5000, mcmc=1000, thin=1,verbose=1,
##D               seed=NA, beta.start=0, sigma2.start=1,
##D               Vb.start=1, mubeta=0, Vbeta=1.0E6,
##D               r=3, R=diag(c(1,0.1,0.1)), nu=0.001, delta=0.001, FixOD=1)
##D 
##D #== MCMC analysis
##D 
##D # Graphics
##D pdf("Posteriors-MCMChlogit.pdf")
##D plot(model$mcmc)
##D dev.off()
##D 
##D # Summary
##D summary(model$mcmc)
##D 
##D # Predictive posterior mean for each observation
##D model$theta.pred
##D 
##D # Predicted-Observed
##D plot(Data$theta,model$theta.pred)
##D abline(a=0,b=1)
##D 
##D ## #Not run
##D ## #You can also compare with lme4 results
##D ## #== lme4 resolution
##D ## library(lme4)
##D ## model.lme4 <- lmer(Y~X1+X2+(1+X1+X2|species),data=Data,family="binomial")
##D ## summary(model.lme4)
##D ## plot(fitted(model.lme4),model$theta.pred,main="MCMChlogit/lme4")
##D ## abline(a=0,b=1)
## End(Not run)




