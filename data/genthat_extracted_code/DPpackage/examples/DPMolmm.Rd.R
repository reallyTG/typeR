library(DPpackage)


### Name: DPMolmm
### Title: Bayesian analysis for a semiparametric ordinal linear mixed
###   model using a DPM of normals
### Aliases: DPMolmm DPMolmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     # Schizophrenia Data
##D       data(psychiatric)
##D       attach(psychiatric)
##D 
##D     # MCMC parameters
##D 
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # Prior information
##D 
##D       prior<-list(alpha=1,
##D                   tau1=0.01,tau2=0.01,
##D                   nu0=4.01,
##D                   tinv=diag(10,1),
##D                   nub=4.01,
##D                   tbinv=diag(10,1),
##D                   mb=rep(0,1),
##D                   Sb=diag(1000,1),
##D                   beta0=rep(0,3), 
##D                   Sbeta0=diag(1000,3))
##D 
##D     # Fitting the model
##D 
##D 
##D       fit1 <- DPMolmm(fixed=imps79o~sweek+tx+sweek*tx,random=~1|id,
##D                       prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D 
##D     # Plot model parameters
##D       plot(fit1)
##D 
##D 
##D     # Plot an specific model parameter
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="sigma-(Intercept)")	
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="ncluster")	
##D 
##D     # Extract random effects
##D     
##D       DPMrandom(fit1)
##D       DPMrandom(fit1,centered=TRUE)
##D 
##D 
##D     # Extract predictive information of random effects
##D     
##D       pred <- DPMrandom(fit1,predictive=TRUE)
##D       plot(pred)
##D 
## End(Not run)



