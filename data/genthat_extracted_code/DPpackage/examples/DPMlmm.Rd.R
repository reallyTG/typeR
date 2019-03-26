library(DPpackage)


### Name: DPMlmm
### Title: Bayesian analysis for a semiparametric linear mixed model using
###   a DPM of normals
### Aliases: DPMlmm DPMlmm.default
### Keywords: models

### ** Examples

## Not run: 
##D     # School Girls Data Example
##D 
##D       data(schoolgirls)
##D       attach(schoolgirls)
##D 
##D     # Prior information
##D 
##D       prior<-list(alpha=1,
##D                   tau1=0.01,tau2=0.01,
##D                   nu0=4.01,
##D                   tinv=diag(10,2),
##D                   nub=4.01,
##D                   tbinv=diag(10,2),
##D                   mb=rep(0,2),
##D                   Sb=diag(1000,2))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-20
##D       ndisplay<-1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Fit the model: First run
##D     
##D       fit1<-DPMlmm(fixed=height~1,random=~age|child,prior=prior,mcmc=mcmc,
##D                    state=state,status=TRUE)
##D       fit1
##D 
##D     # Fit the model: Continuation
##D       state<-fit1$state     
##D     
##D       fit2<-DPMlmm(fixed=height~1,random=~age|child,prior=prior,mcmc=mcmc,
##D                   state=state,status=FALSE)
##D       fit2
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit2)
##D       summary(fit2,hpd=FALSE)
##D 
##D 
##D     # Plot model parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit2,ask=FALSE)
##D       plot(fit2,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit2,ask=FALSE,nfigr=1,nfigc=2,param="sigma-(Intercept)")	
##D       plot(fit2,ask=FALSE,nfigr=1,nfigc=2,param="ncluster")	
## End(Not run)



