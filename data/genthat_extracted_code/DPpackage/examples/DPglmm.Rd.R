library(DPpackage)


### Name: DPglmm
### Title: Bayesian analysis for a semiparametric generalized linear mixed
###   model using a MDP
### Aliases: DPglmm DPglmm.default
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
##D       beta0<-rep(0,9)
##D       Sbeta0<-diag(1000,9)
##D       tinv<-diag(1,1)
##D       prior<-list(a0=2,b0=0.1,nu0=4,tinv=tinv,mub=rep(0,1),Sb=diag(1000,1),
##D                   beta0=beta0,Sbeta0=Sbeta0)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 0
##D       ndisplay <- 1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Fit the Probit model
##D       fit1 <- DPglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                      baseage2+follow+follow2,random=~1|id,
##D                      family=binomial(probit),prior=prior,mcmc=mcmc,
##D                      state=state,status=TRUE)
##D 
##D     # Fit the Logit model
##D       fit2 <- DPglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                      baseage2+follow+follow2,random=~1|id,
##D                      family=binomial(logit),prior=prior,mcmc=mcmc,
##D                      state=state,status=TRUE)
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D       summary(fit2)
##D       summary(fit2,hpd=FALSE)
##D 
##D 
##D     # Plot model parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="baseage")	
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="ncluster")	
## End(Not run)



