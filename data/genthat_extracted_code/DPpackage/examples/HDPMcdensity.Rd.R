library(DPpackage)


### Name: HDPMcdensity
### Title: Bayesian analysis for a hierarchical Dirichlet Process mixture
###   of normals model for conditional density estimation
### Aliases: HDPMcdensity HDPMcdensity.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Data
##D       data(calgb)
##D       attach(calgb)
##D       y <- cbind(Z1,Z2,Z3,T1,T2,B0,B1)
##D       x <- cbind(CTX,GM,AMOF)
##D   
##D       z <- cbind(y,x)
##D 
##D     #  Data for prediction
##D       data(calgb.pred)
##D       xpred <- as.matrix(calgb.pred[,8:10])
##D 
##D 
##D     # Prior information
##D       prior <- list(pe1=0.1,
##D                     pe0=0.1,
##D                     ae=1,
##D                     be=1,
##D                     a0=rep(1,3),
##D                     b0=rep(1,3),
##D                     nu=12,
##D                     tinv=0.25*var(z),
##D  		  m0=apply(z,2,mean),
##D                     S0=var(z),
##D  		  nub=12,
##D                     tbinv=var(z))		
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
##D       fit1 <- HDPMcdensity(formula=y~x,
##D                           study=~study,
##D                           xpred=xpred,
##D                           prior=prior,
##D                           mcmc=mcmc,
##D                           state=state,
##D                           status=TRUE)
##D 
##D     # Posterior inference
##D       fit1
##D       summary(fit1)
##D        
##D     # Plot the parameters
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D 
##D     # Plot the a specific parameters 
##D     # (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE,param="eps",nfigr=1,nfigc=2)
##D 
##D     # Plot the measure for each study 
##D     # under first values for the predictors, xpred[1,]
##D       predict(fit1,pred=1,i=1,r=1) # pred1, study 1
##D       predict(fit1,pred=1,i=2,r=1) # pred1, study 2
##D 
##D     # Plot the measure for each study 
##D     # under second values for the predictors, xpred[2,]
##D       predict(fit1,pred=2,i=1,r=1) # pred2, study 1
##D       predict(fit1,pred=2,i=2,r=1) # pred2, study 2
##D 
##D     # Plot the idiosyncratic measure for each study
##D     # under first values for the predictors, xpred[1,]
##D       predict(fit1,pred=1,i=1,r=0) # study 1
##D       predict(fit1,pred=1,i=2,r=0) # study 2
##D 
##D     # Plot the common measure
##D     # under first values for the predictors, xpred[1,]
##D       predict(fit1,pred=1,i=0)
## End(Not run)



