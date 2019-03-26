library(numOSL)


### Name: mcMAM
### Title: Minimum age model optimization (using a Markov chain Monte Carlo
###   method)
### Aliases: mcMAM mcMAM.default
### Keywords: statistical age models Minimum Age Model equivalent dose
###   Markov chain Monte Carlo

### ** Examples

  # Not run.
  # data(EDdata)
  # Construct a MCMC chain for MAM3.
  # obj<-mcMAM(EDdata$al3,ncomp=-1,addsigma=0.1,nsim=5000)
  # reportSAM(obj,burn=1e3,thin=2)
  #
  # The convergence of the simulations may be diagnosed with 
  # the Gelman and Rubin's convergence diagnostic.
  # library(coda)   # Only if package "coda" has been installed.
  # args<-list(nstart=50)
  # inis1<-list(p=0.01,gamma=26,mu=104,sigma=0.01)
  # inis2<-list(p=0.99,gamma=100,mu=104,sigma=4.99)
  # obj1<-mcMAM(EDdata$al3,ncomp=-2,nsim=3000,inis=inis1,control.args=args)
  # obj2<-mcMAM(EDdata$al3,ncomp=-2,nsim=3000,inis=inis2,control.args=args)
  # chain1<-mcmc(obj1$chains)
  # chain2<-mcmc(obj2$chains)
  # chains<-mcmc.list(chain1,chain2)
  # gelman.plot(chains)



