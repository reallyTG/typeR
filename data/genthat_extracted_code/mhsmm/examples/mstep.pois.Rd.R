library(mhsmm)


### Name: mstep.pois
### Title: Performs re-estimation (the M-step) for a Poisson emission
###   distribution
### Aliases: mstep.pois

### ** Examples

  J<-3
  initial <- rep(1/J,J)
  P <- matrix(c(.8,.5,.1,0.05,.2,.5,.15,.3,.4),nrow=J)
  b <- list(lambda=c(1,3,6))
  model <- hmmspec(init=initial, trans=P, parms.emission=b,dens.emission=dpois.hsmm)
  model
  train <- simulate(model, nsim=300, seed=1234, rand.emis=rpois.hsmm)
  plot(train,xlim=c(0,100))  
  h1 = hmmfit(train,model,mstep=mstep.pois)



