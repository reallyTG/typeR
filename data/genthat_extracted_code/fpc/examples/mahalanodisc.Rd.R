library(fpc)


### Name: mahalanodisc
### Title: Mahalanobis for AWC
### Aliases: mahalanodisc
### Keywords: multivariate

### ** Examples

  options(digits=3)
  x <- cbind(rnorm(50),rnorm(50))
  mahalanodisc(x,c(0,0),cov(x))
  mahalanodisc(x,c(0,0),matrix(0,ncol=2,nrow=2))



