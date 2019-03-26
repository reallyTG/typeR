library(DPpackage)


### Name: FPTbinary
### Title: Bayesian analysis for a Finite Polya Tree Bernoulli regression
###   model
### Aliases: FPTbinary FPTbinary.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D     # Prostate cancer data example
##D       data(nodal)
##D       attach(nodal)
##D       lacid<-log(acid)
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn<-20000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,
##D                    nskip=nskip,ndisplay=ndisplay,
##D                    tune1=1.1,tune2=1.1)
##D 
##D     # Prior distribution
##D       prior <- list(alpha=1, beta0=c(0,rep(0.75,5)),
##D                     Sbeta0=diag(c(100,rep(25,5)),6),M=5)
##D 
##D 
##D     # Fitting the Finite Polya tree model
##D       fit1 <- FPTbinary(ssln~age+lacid+xray+size+grade,
##D                         prior=prior,mcmc=mcmc,
##D                         state=state,status=TRUE) 
##D       fit1
##D 
##D     # Summary with HPD and Credibility intervals
##D       summary(fit1)
##D       summary(fit1,hpd=FALSE)
##D 
##D     # Plot model parameters (to see the plots gradually set ask=TRUE)
##D       plot(fit1)
##D       plot(fit1,nfigr=2,nfigc=2)	
##D 
##D     # Plot an specific model parameter (to see the plots gradually 
##D     # set ask=TRUE)
##D       plot(fit1,ask=FALSE,nfigr=1,nfigc=2,param="xray")	
##D       plot(fit1,ask=FALSE,param="link",nfigc=1,nfigr=1)
##D 
##D     # Table of Pseudo Contour Probabilities
##D       anova(fit1)
##D 
##D 
##D     # Fitting parametric models
##D 
##D       nburn<-20000
##D       nsave<-10000
##D       nskip<-10
##D       ndisplay<-100
##D       mcmc <- list(nburn=nburn,nsave=nsave,
##D                    nskip=nskip,ndisplay=ndisplay,
##D                    tune=1.1)
##D 
##D       fit2 <- Pbinary(ssln~age+lacid+xray+size+grade,link="probit",
##D                       prior=prior,mcmc=mcmc,state=state,status=TRUE)  
##D                     
##D       fit3 <- Pbinary(ssln~age+lacid+xray+size+grade,link="logit",
##D                       prior=prior,mcmc=mcmc,state=state,status=TRUE)  
##D 
##D     
##D     # Model comparison
##D 
##D       DPpsBF(fit1,fit2,fit3)
##D       
## End(Not run)      



