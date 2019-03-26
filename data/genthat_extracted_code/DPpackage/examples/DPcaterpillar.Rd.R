library(DPpackage)


### Name: DPcaterpillar
### Title: Caterpillar Plots for Random Effects
### Aliases: DPcaterpillar
### Keywords: plot nonparametric

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
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Fit the model
##D     
##D       fit1<-DPlmm(fixed=height~1,random=~age|child,prior=prior,
##D                   mcmc=mcmc,state=state,status=TRUE)
##D       fit1
##D 
##D 
##D     # Extract random effects
##D     
##D       DPcaterpillar(DPrandom(fit1))
## End(Not run)



