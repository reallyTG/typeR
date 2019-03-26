library(WeibullR)


### Name: FMbounds
### Title: Fisher Matrix bounds
### Aliases: FMbounds
### Keywords: regression reliability

### ** Examples

set.seed(4321)
data<-rlnorm(30,2,1.2)
asymptotic_bounds<-FMbounds(mleframe(data[7:30],data[1:6]), dist="lognormal")



