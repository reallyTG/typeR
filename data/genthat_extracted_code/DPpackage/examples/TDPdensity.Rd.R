library(DPpackage)


### Name: TDPdensity
### Title: Semiparametric Bayesian density estimation using DP Mixtures of
###   Triangular Distributions
### Aliases: TDPdensity TDPdensity.default
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
##D                   kmax=50,
##D                   a0=1,
##D                   b0=1)
##D 
##D     # Fitting the model
##D 
##D       fit<-TDPdensity(y=speeds,prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D       
##D       plot(fit)
##D       
##D 
## End(Not run)



