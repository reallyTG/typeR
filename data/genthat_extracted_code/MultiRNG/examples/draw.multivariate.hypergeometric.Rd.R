library(MultiRNG)


### Name: draw.multivariate.hypergeometric
### Title: Pseudo-Random Number Generation under Multivariate
###   Hypergeometric Distribution
### Aliases: draw.multivariate.hypergeometric

### ** Examples

meanvec=c(10,10,12) ; myk=5
mydata=draw.multivariate.hypergeometric(no.row=1e5,d=3,mean.vec=meanvec,k=myk)
apply(mydata,2,mean)-myk*meanvec/sum(meanvec)



