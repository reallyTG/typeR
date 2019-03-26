library(mhsmm)


### Name: predict.hmmspec
### Title: Prediction function for hmmspec
### Aliases: predict.hmmspec

### ** Examples

     J<-3
     initial <- rep(1/J,J)
     P <- matrix(c(.8,.5,.1,0.05,.2,.5,.15,.3,.4),nrow=J)
     b <- list(mu=c(-3,0,2),sigma=c(2,1,.5))
     model <- hmmspec(init=initial, trans=P, parms.emission=b,dens.emission=dnorm.hsmm)    
     train <- simulate(model, nsim=300, seed=1234, rand.emis=rnorm.hsmm)
     mean(predict(model,train)$s!=train$s) #error rate when true model is known



