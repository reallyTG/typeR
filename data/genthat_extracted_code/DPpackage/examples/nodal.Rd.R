library(DPpackage)


### Name: nodal
### Title: Nodal Involvement Data
### Aliases: nodal
### Keywords: datasets

### ** Examples

## Not run: 
##D     # Data
##D       data(nodal)
##D       attach(nodal)
##D       lacid<-log(acid)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn<-5000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune=1.1)
##D 
##D 
##D     # Prior distribution
##D       prior <- list(alpha=1,beta0=c(0,rep(0.75,5)),
##D                     Sbeta0=diag(c(100,rep(25,5)),6))
##D 
##D     # Fit the model
##D       fit1 <- DPbinary(ssln~age+lacid+xray+size+grade,prior=prior,mcmc=mcmc,
##D                        state=state,status=TRUE) 
##D       fit1
##D 
## End(Not run)




