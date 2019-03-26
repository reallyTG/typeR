library(lmmen)


### Name: lmmen
### Title: linear mixed model Elastic Net
### Aliases: lmmen

### ** Examples

 dat <- initialize_example(n.i = 5,n = 30,q=4,seed=1)
 init <- init.beta(dat,method='glmnet')
 lmmen(data=dat,init.beta=init,frac=c(0.8,1,1,1))



