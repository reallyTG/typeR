library(HWEBayes)


### Name: LambdaOptim
### Title: Obtains values for the prior specification for lambda
### Aliases: LambdaOptim
### Keywords: htest

### ** Examples

bvec <- c(1,1,1,1)
init <- c(-3,log(1.1))
lampr <- LambdaOptim(nsim=10000,bvec=bvec,f1=0,f2=0.26,p1=0.5,p2=0.95,init)



