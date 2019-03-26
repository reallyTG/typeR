library(DPpackage)


### Name: DPdensity
### Title: Semiparametric Bayesian density estimation using a DPM of
###   normals
### Aliases: DPdensity DPdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     ####################################
##D     # Univariate example
##D     ####################################
##D 
##D     # Data
##D       data(galaxy)
##D       galaxy <- data.frame(galaxy,speeds=galaxy$speed/1000) 
##D       attach(galaxy)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 1000
##D       nsave <- 10000
##D       nskip <- 10
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Example of Prior information 1
##D     # Fixing alpha, m1, and Psi1
##D 
##D       prior1 <- list(alpha=1,m1=rep(0,1),psiinv1=diag(0.5,1),nu1=4,
##D                      tau1=1,tau2=100)
##D 
##D 
##D     # Example of Prior information 2
##D     # Fixing alpha and m1
##D 
##D       prior2 <- list(alpha=1,m1=rep(0,1),psiinv2=solve(diag(0.5,1)),
##D                      nu1=4,nu2=4,tau1=1,tau2=100)
##D 
##D 
##D     # Example of Prior information 3
##D     # Fixing only alpha
##D 
##D       prior3 <- list(alpha=1,m2=rep(0,1),s2=diag(100000,1),
##D                    psiinv2=solve(diag(0.5,1)),
##D                    nu1=4,nu2=4,tau1=1,tau2=100)
##D 
##D 
##D     # Example of Prior information 4
##D     # Everything is random
##D 
##D       prior4 <- list(a0=2,b0=1,m2=rep(0,1),s2=diag(100000,1),
##D                    psiinv2=solve(diag(0.5,1)),
##D                    nu1=4,nu2=4,tau1=1,tau2=100)
##D 
##D     # Fit the models
##D 
##D       fit1.1 <- DPdensity(y=speeds,prior=prior1,mcmc=mcmc,
##D                           state=state,status=TRUE)
##D       fit1.2 <- DPdensity(y=speeds,prior=prior2,mcmc=mcmc,
##D                           state=state,status=TRUE)
##D       fit1.3 <- DPdensity(y=speeds,prior=prior3,mcmc=mcmc,
##D                           state=state,status=TRUE)
##D       fit1.4 <- DPdensity(y=speeds,prior=prior4,mcmc=mcmc,
##D                           state=state,status=TRUE)
##D 
##D     # Posterior means
##D       fit1.1
##D       fit1.2
##D       fit1.3
##D       fit1.4
##D 
##D     # Plot the estimated density
##D       plot(fit1.1,ask=FALSE)
##D       plot(fit1.2,ask=FALSE)
##D       plot(fit1.3,ask=FALSE)
##D       plot(fit1.4,ask=FALSE)
##D 
##D     # Extracting the density estimate
##D       cbind(fit1.1$x1,fit1.1$dens)
##D       cbind(fit1.2$x1,fit1.2$dens)
##D       cbind(fit1.3$x1,fit1.3$dens)
##D       cbind(fit1.4$x1,fit1.4$dens)
##D       
##D     # Plot the parameters (only prior 2 for illustration)
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1.2,ask=FALSE,output="param")
##D 
##D     # Plot the a specific parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1.2,ask=FALSE,output="param",param="psi1-speeds",
##D            nfigr=1,nfigc=2)
##D 
##D     # Extracting the posterior mean of the specific 
##D     # means and covariance matrices 
##D     # (only prior 2 for illustration)
##D       DPrandom(fit1.2) 
##D 
##D     # Ploting predictive information about the specific 
##D     # means and covariance matrices 
##D     # with HPD and Credibility intervals
##D     # (only prior 2 for illustration)
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(DPrandom(fit1.2,predictive=TRUE),ask=FALSE)
##D       plot(DPrandom(fit1.2,predictive=TRUE),ask=FALSE,hpd=FALSE)
##D 
##D     # Ploting information about all the specific means 
##D     # and covariance matrices 
##D     # with HPD and Credibility intervals
##D     # (only prior 2 for illustration)
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(DPrandom(fit1.2),ask=FALSE,hpd=FALSE)
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
##D 
##D       s2 <- matrix(c(10000,0,0,1),ncol=2)
##D       m2 <- c(180,3)
##D       psiinv2 <- solve(matrix(c(10000,0,0,1),ncol=2))
##D      
##D       prior <- list(a0=1,b0=1/5,nu1=4,nu2=4,s2=s2,
##D                     m2=m2,psiinv2=psiinv2,tau1=0.01,tau2=0.01)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 10000
##D       nskip <- 10
##D       ndisplay <- 1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Fit the model
##D       fit1 <- DPdensity(y=cbind(radiation,ozone),prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE,na.action=na.omit)
##D 
##D     # Plot the estimated density
##D       plot(fit1)
##D 
##D     # Extracting the density estimate
##D       fit1$x1
##D       fit1$x2
##D       fit1$dens
## End(Not run)



