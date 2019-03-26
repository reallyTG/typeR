library(clinDR)


### Name: predict.fitEmaxB
### Title: Estimated mean and posterior intervals derived from a Bayesian
###   hyperbolic or sigmiodial Emax model.
### Aliases: predict.fitEmaxB

### ** Examples


## Not run: 
##D data("examples14")
##D exdat<-examples14[[6]]
##D 
##D prior<-prior.control(epmu=0,epsd=10,emaxmu=0,emaxsd=10,p50=0.25,
##D 				sigmalow=0.01,sigmaup=3)
##D mcmc<-mcmc.control(chains=3)
##D 
##D fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
##D 				count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)
##D 
##D predout<-predict(fitout,dosevec=sort(unique(exdat$dose)))
## End(Not run)



