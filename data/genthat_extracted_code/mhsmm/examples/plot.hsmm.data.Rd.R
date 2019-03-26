library(mhsmm)


### Name: plot.hsmm.data
### Title: Plot function for hsmm data
### Aliases: plot.hsmm.data

### ** Examples

  J<-3
  initial <- rep(1/J,J)
  P <- matrix(c(.8,.5,.1,0.05,.2,.5,.15,.3,.4),nrow=J)
  b <- list(mu=c(-3,0,2),sigma=c(2,1,.5))
  model <- hmmspec(init=initial, trans=P, parms.emission=b, dens.emission=dnorm.hsmm)
  
  train <- simulate(model, nsim=300, seed=1234, rand.emis=rnorm.hsmm)
  plot(train,xlim=c(0,100))



