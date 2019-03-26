library(DPpackage)


### Name: PTrandom
### Title: Extracts Random Effects
### Aliases: PTrandom PTrandom.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # School Girls Data Example
##D       data(schoolgirls)
##D       attach(schoolgirls)
##D  
##D     # Prior information
##D       prior<-list(alpha=1,
##D                   M=4,
##D                   tau1=0.01,tau2=0.01,
##D                   nu0=4.01,
##D                   tinv=diag(10,2),
##D                   mub=rep(0,2),
##D                   Sb=diag(1000,2))
##D  
##D     # Initial state
##D       state <- NULL
##D  
##D     # MCMC parameters
##D  
##D       nburn<-5000
##D       nsave<-5000
##D       nskip<-0
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                     tune1=1.5,tune2=1.1)
##D  
##D     # Fitting the model
##D      
##D       fit1<-PTlmm(fixed=height~1,random=~age|child,prior=prior,mcmc=mcmc,
##D                   state=state,status=TRUE)
##D       fit1
##D  
##D  
##D     # Extract random effects
##D     
##D       PTrandom(fit1)
##D       
##D       plot(PTrandom(fit1))
##D 
##D     # Extract predictive information of random effects
##D     
##D       PTrandom(fit1,predictive=TRUE)
##D       plot(PTrandom(fit1,predictive=TRUE,gridl=c(75,89,3.8,7.5)))
## End(Not run)



