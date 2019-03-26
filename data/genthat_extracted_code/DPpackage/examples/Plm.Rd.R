library(DPpackage)


### Name: Plm
### Title: Bayesian analysis for a parametric linear regression model
### Aliases: Plm Plm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     ############################################
##D     # The Australian Institute of Sport's data
##D     ############################################
##D       data(sports)
##D       attach(sports)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 10000
##D       nskip <- 20
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,
##D                    ndisplay=ndisplay)
##D 
##D     # Prior information
##D       prior <- list(beta0=rep(0,3),
##D                     Sbeta0=diag(1000,3),
##D                     tau1=0.01,
##D                     tau2=0.01)
##D 
##D     # Fit the model
##D 
##D       fit <- Plm(formula=bmi~lbm+gender,prior=prior,mcmc=mcmc,
##D                   state=state,status=TRUE) 
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit)
##D       summary(fit,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit)
##D       plot(fit,nfigr=2,nfigc=2)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit)
##D 
## End(Not run)      



