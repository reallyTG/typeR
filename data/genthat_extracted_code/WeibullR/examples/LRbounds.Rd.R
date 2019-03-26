library(WeibullR)


### Name: LRbounds
### Title: Likelihood Ratio bounds
### Aliases: LRbounds
### Keywords: regression reliability

### ** Examples

set.seed(4321)
data<-rlnorm(30,2,1.2)
bounds<-LRbounds(mleframe(data[7:30],data[1:6]), dist="lognormal")



