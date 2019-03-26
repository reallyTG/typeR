library(DPpackage)


### Name: PTolmm
### Title: Bayesian analysis for a semiparametric ordinal linear mixed
###   model using a MMPT
### Aliases: PTolmm PTolmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     # Schizophrenia Data
##D       data(psychiatric)
##D       attach(psychiatric)
##D 
##D     # Prior information
##D       prior <- list(M=4,
##D                     frstlprob=FALSE,
##D                     alpha=1,
##D                     nu0=4.01,
##D                     tinv=diag(1,1),
##D                     mub=rep(0,1),
##D                     Sb=diag(100,1),
##D                     beta0=rep(0,3),
##D                     Sbeta0=diag(1000,3))
##D 
##D     # MCMC parameters
##D       mcmc <- list(nburn=10000,
##D                    nsave=10000,
##D                    nskip=20,
##D                    ndisplay=100,
##D                    samplef=1)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # Fitting the model
##D       fit1 <- PTolmm(fixed=imps79o~sweek+tx+sweek*tx,random=~1|id,prior=prior,
##D                      mcmc=mcmc,state=state,status=TRUE)
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters
##D       plot(fit1)
##D 
##D     # Plot an specific model parameter
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="sigma-(Intercept)")	
##D 
##D     # Extract random effects
##D       PTrandom(fit1)
##D 
##D     # Extract predictive information of random effects
##D       aa<-PTrandom(fit1,predictive=TRUE)
##D       aa
##D 
##D     # Predictive marginal and joint distributions      
##D       plot(aa)
## End(Not run)



