library(DPpackage)


### Name: predict.HDPMdensity
### Title: Predictive Information for the Dependent Random Probability
###   Measures.
### Aliases: predict.HDPMdensity
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     # Data
##D       data(calgb)
##D       attach(calgb)
##D       y <- cbind(Z1,Z2,Z3,T1,T2,B0,B1)
##D 
##D     # Prior information
##D       prior <- list(pe1=0.1,
##D                     pe0=0.1,
##D                     ae=1,
##D                     be=1,
##D                     a0=rep(1,3),
##D                     b0=rep(1,3),
##D                     nu=9,
##D                     tinv=0.25*var(y),
##D  		    m0=apply(y,2,mean),
##D                     S0=var(y),
##D  		    nub=9,
##D                     tbinv=var(y))		
##D 
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       mcmc <- list(nburn=5000,
##D                    nsave=5000,
##D                    nskip=3,
##D                    ndisplay=100)
##D 
##D     # Fitting the model
##D       fit1 <- HDPMdensity(y=y,
##D                           study=study,
##D                           prior=prior,
##D                           mcmc=mcmc,
##D                           state=state,
##D                           status=TRUE)
##D 
##D     # Posterior inference
##D       fit1
##D       summary(fi1)
##D        
##D     # Plot the parameters
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D 
##D     # Plot the a specific parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,param="eps",nfigr=1,nfigc=2)
##D 
##D    # Plot the measure for each study
##D       predict(fit1,i=1,r=1) # study 1
##D       predict(fit1,i=2,r=1) # study 2
##D 
##D     # Plot the idiosyncratic measure for each study
##D       predict(fit1,i=1,r=0) # study 1
##D       predict(fit1,i=2,r=0) # study 2
##D 
##D     # Plot the common measure
##D       predict(fit1,i=0)
## End(Not run)



