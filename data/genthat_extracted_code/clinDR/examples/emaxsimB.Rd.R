library(clinDR)


### Name: emaxsimB
### Title: Simulate Emax Bayesian estimation
### Aliases: emaxsimB
### Keywords: Bayes Emax

### ** Examples

## Not run: 
##D 
##D ### emaxsimB changes the random number seed
##D 
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
##D ### custom code to compute the distribution of the dose yielding
##D ### a target diff with pbo
##D customCode<-function(parms,residSD,pVal,dose,y,customParms){
##D 	target<-customParms
##D 	ed50<-exp(parms[,1])
##D 	emax<-parms[,2]
##D 	td<-ifelse(emax-target>0,ed50*(target/(emax-target)),Inf)
##D 	tdest<-median(td)
##D 	lb<-quantile(td,0.1)
##D 	ub<-quantile(td,0.9)
##D 	return(c(td=tdest,lb=lb,ub=ub))
##D }
##D 
##D D1 <- emaxsimB(nsim,gen, prior, modType=3,seed=12357,mcmc=mcmc,check=FALSE,
##D 				customCode=customCode,customParms=1.0)
##D D1
## End(Not run)



