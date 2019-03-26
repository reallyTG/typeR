library(mhsmm)


### Name: dmvnorm.hsmm
### Title: Emission ensity function for a multivariate normal emission
###   distribution
### Aliases: dmvnorm.hsmm

### ** Examples

  J<-2
  initial <- rep(1/J,J)
  P <- matrix(c(.3,.5,.7,.5),nrow=J)
  b <- list(mu=list(c(-3,0),c(1,2)),sigma=list(diag(2),matrix(c(4,2,2,3), ncol=2)))
  model <- hmmspec(init=initial, trans=P, parms.emission=b,dens.emission=dmvnorm.hsmm)
  model
  train <- simulate(model, nsim=300, seed=1234, rand.emis=rmvnorm.hsmm)
  plot(train,xlim=c(0,100))
  h1 = hmmfit(train,model,mstep=mstep.mvnorm)



