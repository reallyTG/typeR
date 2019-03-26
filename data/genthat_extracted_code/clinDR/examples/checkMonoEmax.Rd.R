library(clinDR)


### Name: checkMonoEmax
### Title: Bayes posterior predictive test for Emax (monotone) model fit
### Aliases: checkMonoEmax
### Keywords: nonlinear

### ** Examples

## Not run: 
##D 
##D data("examples14")
##D exdat<-examples14[[6]]
##D 
##D prior<-prior.control(epmu=0,epsd=10,emaxmu=0,emaxsd=10,p50=0.25,
##D 				sigmalow=0.01,sigmaup=3)
##D mcmc<-mcmc.control(chains=3)
##D 
##D fitout<-fitEmaxB(exdat$y,exdat$dose,prior,modType=4,prot=exdat$prot,
##D 				count=exdat$nsize,msSat=(exdat$sd)^2,mcmc=mcmc)
##D parms<-coef(fitout)[,1:4]  #use first intercept
##D 
##D checkMonoEmax(y=exdat$y, dose=exdat$dose, parm=parms, sigma2=(sigma(fitout))^2,
##D       nvec=exdat$nsize, trend='negative')
##D       
## End(Not run)
## Don't show: 

data("examples14")
exdat<-examples14[[6]]


parms<-cbind(rnorm(5,-.69,.2),rnorm(5,.5,.01),rnorm(5,-5.19,0.2),rnorm(5,1.8,.02))
sig2<-rnorm(5,0.4,0.01)

checkMonoEmax(y=exdat$y, dose=exdat$dose, parm=parms, sigma2=sig2^2,
      nvec=exdat$nsize, trend='negative')
## End(Don't show)



