library(DPpackage)


### Name: PTdensity
### Title: Nonparametric Bayesian density estimation using Mixtures of
###   Polya Trees
### Aliases: PTdensity PTdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # Univariate example
##D     ####################################
##D 
##D     # Data
##D       data(galaxy)
##D       galaxy<-data.frame(galaxy,speeds=galaxy$speed/1000) 
##D       attach(galaxy)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn <- 2000
##D       nsave <- 5000
##D       nskip <- 49
##D       ndisplay <- 500
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune1=0.03,tune2=0.25,tune3=1.8)
##D 
##D     # Prior information
##D       prior<-list(a0=1,b0=0.01,M=6,m0=21,S0=100,sigma=20)
##D 
##D     # Fitting the model
##D 
##D       fit1 <- PTdensity(y=speeds,ngrid=1000,prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE)
##D 
##D     # Posterior means
##D       fit1
##D 
##D     # Plot the estimated density
##D       plot(fit1,ask=FALSE)
##D       points(speeds,rep(0,length(speeds)))
##D 
##D     # Plot the parameters
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,output="param")
##D 
##D     # Extracting the density estimate
##D       cbind(fit1$x1,fit1$dens)
##D 
##D 
##D     ####################################
##D     # Bivariate example
##D     ####################################
##D 
##D     # Data
##D       data(airquality)
##D       attach(airquality)
##D 
##D       ozone <- Ozone**(1/3)
##D       radiation <- Solar.R
##D 
##D     # Prior information
##D       prior <- list(a0=5,b0=1,M=4,
##D                     m0=c(0,0),S0=diag(10000,2),
##D                     nu0=4,tinv=diag(1,2))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn <- 2000
##D       nsave <- 5000
##D       nskip <- 49
##D       ndisplay <- 500
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune1=0.8,tune2=1.0,tune3=1)
##D 
##D     # Fitting the model
##D       fit1 <- PTdensity(y=cbind(radiation,ozone),prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE,na.action=na.omit)
##D 
##D       fit1
##D 
##D     # Plot the estimated density
##D       plot(fit1)
##D 
##D     # Extracting the density estimate
##D       x1 <- fit1$x1
##D       x2 <- fit1$x2
##D       z <- fit1$dens
##D       par(mfrow=c(1,1))
##D       contour(x1,x2,z)
##D       points(fit1$y)  
##D 
## End(Not run)



