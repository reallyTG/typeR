library(fpc)


### Name: cmahal
### Title: Generation of tuning constant for Mahalanobis fixed point
###   clusters.
### Aliases: cmahal
### Keywords: cluster

### ** Examples

  plot(1:100,cmahal(100,3,nmin=5,cmin=qchisq(0.99,3),nc1=90),
       xlab="FPC size", ylab="cmahal")



