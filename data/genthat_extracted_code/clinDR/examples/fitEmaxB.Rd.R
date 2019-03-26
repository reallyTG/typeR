library(clinDR)


### Name: fitEmaxB
### Title: Bayesian fit of hyperbolic or sigmoidal Emax models to
###   continuous/binary dose response data.
### Aliases: fitEmaxB
### Keywords: dose response mcmc

### ** Examples

## Not run: 
##D 
##D data("examples14")
##D exdat<-examples14[[1]]
##D 
##D prior<-prior.control(epmu=0,epsd=4,emaxmu=0,emaxsd=4,p50=0.1,
##D 				sigmalow=0.01,sigmaup=3)
##D 										
##D mcmc<-mcmc.control(chains=3)
##D 
##D fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
##D 				count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)
## End(Not run)



