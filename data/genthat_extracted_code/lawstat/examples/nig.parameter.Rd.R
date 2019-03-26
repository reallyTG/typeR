library(lawstat)


### Name: nig.parameter
### Title: Generating parameters for the normal inverse Gaussian (NIG)
###   distribution
### Aliases: nig.parameter
### Keywords: htest

### ** Examples


library(fBasics)
test<-nig.parameter(0,2,5,1)
random<-rnig(1000000,alpha=test$alpha,beta=test$beta,mu=test$mu,delta=test$delta)
mean(random)
##   [1] 0.0003896483
var(random)
##   [1] 2.007351
kurtosis(random)
##   [1] 5.085051
##   attr(,"method")
##   [1] "excess"
skewness(random)
##   [1] 1.011352
##   attr(,"method")
##   [1] "moment"




