library(DPpackage)


### Name: BDPdensity
### Title: Semiparametric Bayesian density estimation using Bernstein
###   Polynomials
### Aliases: BDPdensity BDPdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Data
##D       data(galaxy)
##D       galaxy<-data.frame(galaxy,speeds=galaxy$speed/1000) 
##D       attach(galaxy)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn<-1000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Prior
##D       prior<-list(aa0=2.01,
##D                   ab0=0.01,
##D                   kmax=1000,
##D                   a0=1,
##D                   b0=1)
##D 
##D     # Fitting the model
##D 
##D       fit <- BDPdensity(y=speeds,prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE)
##D       
##D       plot(fit)
##D       
##D 
## End(Not run)



