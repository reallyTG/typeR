library(DPpackage)


### Name: PTlmm
### Title: Bayesian analysis for a semiparametric linear mixed model using
###   a MMPT
### Aliases: PTlmm PTlmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # School Girls Data Example
##D       data(schoolgirls)
##D       attach(schoolgirls)
##D 
##D     # Prior information
##D       prior <- list(a0=5,b0=1,
##D                     M=4,
##D                     typepr=1,
##D                     frstlprob=FALSE,
##D                     tau1=0.01,tau2=0.01,
##D                     nu0=4.01,
##D                     tinv=diag(10,2),
##D                     mub=rep(0,2),
##D                     Sb=diag(1000,2))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 10000
##D       nsave <- 10000
##D       nskip <- 20
##D       ndisplay <- 1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune1=1.5,tune2=1.1,samplef=1)
##D 
##D     # Fitting the model
##D     
##D       fit1 <- PTlmm(fixed=height~1,random=~age|child,prior=prior,mcmc=mcmc,
##D                     state=state,status=TRUE)
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="sigma-(Intercept)")	
##D 
##D     # Random effects information
##D       PTrandom(fit1)
##D       
##D     # Predictive marginal and joint distributions
##D       plot(PTrandom(fit1,predictive=TRUE))
## End(Not run)



