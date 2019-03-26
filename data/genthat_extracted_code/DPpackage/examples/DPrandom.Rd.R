library(DPpackage)


### Name: DPrandom
### Title: Extracts Random Effects
### Aliases: DPrandom DPrandom.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # School Girls Data Example
##D 
##D       data(schoolgirls)
##D       attach(schoolgirls)
##D 
##D     # Prior information
##D     # Prior information
##D 
##D       tinv<-diag(10,2)
##D       prior<-list(alpha=1,nu0=4.01,tau1=0.001,tau2=0.001,
##D       tinv=tinv,mub=rep(0,2),Sb=diag(1000,2))
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
##D     # Fit the model
##D     
##D       fit1<-DPlmm(fixed=height~1,random=~age|child,prior=prior,mcmc=mcmc,
##D                   state=state,status=TRUE)
##D       fit1
##D 
##D 
##D     # Extract random effects
##D     
##D       DPrandom(fit1)
##D       DPrandom(fit1,centered=TRUE)
##D       
##D       plot(DPrandom(fit1))
##D       plot(DPrandom(fit1,centered=TRUE))
##D 
##D     # Extract predictive information of random effects
##D     
##D       DPrandom(fit1,predictive=TRUE)
##D       DPrandom(fit1,centered=TRUE,predictive=TRUE)
##D       
##D       plot(DPrandom(fit1,predictive=TRUE))
##D       plot(DPrandom(fit1,centered=TRUE,predictive=TRUE))
## End(Not run)



