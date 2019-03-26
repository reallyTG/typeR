library(DPpackage)


### Name: DPMglmm
### Title: Bayesian analysis for a semiparametric generalized linear mixed
###   model using a DPM of normals
### Aliases: DPMglmm DPMglmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Respiratory Data Example
##D 
##D       data(indon)
##D       attach(indon)
##D 
##D       baseage2<-baseage**2
##D       follow<-age-baseage
##D       follow2<-follow**2 
##D 
##D     # Prior information
##D 
##D       prior<-list(alpha=1,
##D                   nu0=4.01,
##D                   tinv=diag(1,1),
##D                   nub=4.01,
##D                   tbinv=diag(1,1),
##D                   mb=rep(0,1),
##D                   Sb=diag(1000,1),
##D                   beta0=rep(0,9),
##D                   Sbeta0=diag(1000,9))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-5000
##D       nsave<-25000
##D       nskip<-20
##D       ndisplay<-1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Fit the Probit model
##D       fit1<-DPMglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                     baseage2+follow+follow2,
##D                     random=~1|id,family=binomial(probit),
##D                     prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D 
##D     # Fit the Logit model
##D       fit2<-DPMglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                     baseage2+follow+follow2,random=~1|id,
##D                     family=binomial(logit),
##D                     prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D       summary(fit2)
##D       summary(fit2,hpd=FALSE)
##D 
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="baseage")	
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="ncluster")	
## End(Not run)



