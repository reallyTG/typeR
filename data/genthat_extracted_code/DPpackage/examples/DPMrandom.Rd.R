library(DPpackage)


### Name: DPMrandom
### Title: Extracts Random Effects
### Aliases: DPMrandom DPMrandom.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
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
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fitting the model
##D     
##D       fit1 <- DPMlmm(fixed=height~1,random=~age|child,
##D                      prior=prior,mcmc=mcmc,
##D                      state=state,status=TRUE)
##D       fit1
##D 
##D     # Extract random effects
##D     
##D       DPMrandom(fit1)
##D       DPMrandom(fit1,centered=TRUE)
##D       
##D       plot(DPMrandom(fit1))
##D       plot(DPMrandom(fit1,centered=TRUE))
##D 
##D     # Extract predictive information of random effects
##D     
##D       DPMrandom(fit1,predictive=TRUE)
##D       plot(DPMrandom(fit1,predictive=TRUE,gridl=c(75,89,3.8,7.5)))
##D 
## End(Not run)



