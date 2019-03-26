library(DPpackage)


### Name: DPpsBF
### Title: Computes Pseudo Bayes Factors from DPpackage output
### Aliases: DPpsBF
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D     # Respiratory Data Example
##D 
##D       data(indon)
##D       attach(indon)
##D 
##D       baseage2 <- baseage**2
##D       follow <- age-baseage
##D       follow2 <- follow**2 
##D 
##D     # Prior information
##D 
##D       beta0 <- rep(0,9)
##D       Sbeta0 <- diag(1000,9)
##D       tinv <- diag(1,1)
##D       prior <- list(a0=2,b0=0.1,nu0=4,tinv=tinv,
##D                     mub=rep(0,1),Sb=diag(1000,1),
##D                     beta0=beta0,Sbeta0=Sbeta0)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D 
##D       nburn <- 5
##D       nsave <- 100
##D       nskip <- 5
##D       ndisplay <- 100
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay)
##D 
##D     # Fit the Probit model
##D       fit1 <- DPglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                      baseage2+follow+follow2,random=~1|id,
##D                      family=binomial(probit),
##D                      prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D 
##D     # Fit the Logit model
##D       fit2 <- DPglmm(fixed=infect~gender+height+cosv+sinv+xero+baseage+
##D                      baseage2+follow+follow2,random=~1|id,
##D                      family=binomial(logit),
##D                      prior=prior,mcmc=mcmc,state=state,status=TRUE)
##D 
##D     # Model comparison
##D       DPpsBF(fit1,fit2)
##D 
##D 
## End(Not run)



