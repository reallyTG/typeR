library(spate)


### Name: spate.mcmc
### Title: MCMC algorithm for fitting the model.
### Aliases: spate.mcmc

### ** Examples

##Specify hyper-parameters
par <- c(rho0=0.1,sigma2=0.2,zeta=0.5,rho1=0.1,gamma=2,alpha=pi/4,muX=0.2,muY=-0.2,tau2=0.01)
##Simulate data
spateSim <- spate.sim(par=par,n=20,T=20,seed=4)
w <- spateSim$w

##Below is an example to illustrate the use of the MCMC algorithm.
##In practice, more samples are needed for a sufficiently large effective sample size.

##The following takes a couple of minutes.
##Load the precomputed object some lines below to save time.
##spateMCMC <- spate.mcmc(y=w,x=NULL,SV=c(rho0=0.2,sigma2=0.1,
##              zeta=0.25,rho1=0.2,gamma=1,alpha=0.3,muX=0,muY=0,tau2=0.005),
##              RWCov=diag(c(0.005,0.005,0.05,0.005,0.005,0.001,0.0002,0.0002,0.0002)),
##              Nmc=10000,BurnIn=2000,seed=4,Padding=FALSE,plotTrace=TRUE,NCovEst=500,
##              BurnInCovEst=500,trueVal=par,saveProcess=TRUE)
##spateMCMC
##plot(spateMCMC.fit,true=par,postProcess=TRUE)

##Instead of waiting, you can also use this precomputed object
data("spateMCMC")
spateMCMC
plot(spateMCMC,true=par,medianHist=FALSE)




