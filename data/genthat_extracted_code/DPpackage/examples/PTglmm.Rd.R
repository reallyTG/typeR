library(DPpackage)


### Name: PTglmm
### Title: Bayesian analysis for a semiparametric generalized linear mixed
###   model using a MMPT
### Aliases: PTglmm PTglmm.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Respiratory Data Example
##D       data(indon)
##D       attach(indon)
##D 
##D       baseage2 <- baseage**2
##D       follow <- age-baseage
##D       follow2 <- follow**2 
##D 
##D     # Prior information
##D 
##D       prior <- list(alpha=1,
##D                     M=4, 
##D                     frstlprob=FALSE,
##D                     nu0=4,
##D                     tinv=diag(1,1),
##D                     mub=rep(0,1),
##D                     Sb=diag(1000,1),
##D                     beta0=rep(0,9),
##D                     Sbeta0=diag(10000,9))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5000
##D       nsave <- 5000
##D       nskip <- 20
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,
##D                    nsave=nsave,
##D                    nskip=nskip,
##D                    ndisplay=ndisplay,
##D                    tune1=0.5,tune2=0.5,
##D                    samplef=1)
##D 
##D     # Fitting the Logit model
##D       fit1 <- PTglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+baseage2+
##D                      follow+follow2,random=~1|id,family=binomial(logit),
##D                      prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D 
##D       fit1 
##D 
##D       plot(PTrandom(fit1,predictive=TRUE))
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1,ask=FALSE)
##D       plot(fit1,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Extract random effects
##D       PTrandom(fit1)
##D       PTrandom(fit1,centered=TRUE)
##D 
##D     # Extract predictive information of random effects
##D       PTrandom(fit1,predictive=TRUE)
##D 
##D     # Predictive marginal and joint distributions      
##D       plot(PTrandom(fit1,predictive=TRUE))
##D 
##D     # Fitting the Probit model
##D       fit2 <- PTglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+baseage2+
##D                      follow+follow2,random=~1|id,family=binomial(probit),
##D                      prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D       fit2 
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit2,ask=FALSE)
##D       plot(fit2,ask=FALSE,nfigr=2,nfigc=2)	
##D 
##D     # Extract random effects
##D       PTrandom(fit2)
##D 
##D     # Extract predictive information of random effects
##D       PTrandom(fit2,predictive=TRUE)
##D 
##D     # Predictive marginal and joint distributions      
##D       plot(PTrandom(fit2,predictive=TRUE))
## End(Not run)



