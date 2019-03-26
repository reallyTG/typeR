library(clinDR)


### Name: plot.fitEmaxB
### Title: Plot a Emax model and dose group means.
### Aliases: plot.fitEmaxB
### Keywords: nonlinear

### ** Examples

## Not run: 
##D data("examples14")
##D exdat<-examples14[[1]]
##D 
##D prior<-prior.control(epmu=0,epsd=4,emaxmu=0,emaxsd=4,p50=0.1,
##D 				sigmalow=0.01,sigmaup=3)
##D mcmc<-mcmc.control(chains=3)
##D 
##D fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
##D 				count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)
##D 				
##D plot(fitout)
## End(Not run)



