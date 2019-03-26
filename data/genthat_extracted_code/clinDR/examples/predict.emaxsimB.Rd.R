library(clinDR)


### Name: predict.emaxsimB
### Title: Mean response and SE for each replicate data set in an emaxsimB
###   object
### Aliases: predict.emaxsimB
### Keywords: nonlinear

### ** Examples


## Not run: 
##D nsim<-50
##D idmax<-5
##D doselev<-c(0,5,25,50,100)
##D n<-c(78,81,81,81,77)
##D Ndose<-length(doselev)
##D 
##D ### population parameters for simulation
##D e0<-2.465375 
##D ed50<-67.481113 
##D emax<-4.127726
##D sdy<-7.967897
##D pop<-c(log(ed50),emax,e0)    
##D meanlev<-emaxfun(doselev,pop)  
##D 
##D ###FixedMean is specialized constructor function for emaxsim
##D gen<-FixedMean(n,doselev,meanlev,sdy)  
##D 
##D prior<-prior.control(epmu=0,epsd=30,emaxmu=0,emaxsd=30,p50=50,sigmalow=0.1,
##D 		sigmaup=30,edDF=5)
##D mcmc<-mcmc.control(chains=1,warmup=500,iter=5000,seed=53453,
##D 		propInit=0.15,adapt_delta = 0.95)
##D 
##D 
##D D1 <- emaxsimB(nsim,gen, prior, modType=3,seed=12357,mcmc=mcmc,check=FALSE)
##D 
##D predict(D1,dose=20)
## End(Not run)



