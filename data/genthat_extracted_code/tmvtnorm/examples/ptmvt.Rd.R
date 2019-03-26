library(tmvtnorm)


### Name: ptmvt
### Title: Truncated Multivariate Student t Distribution
### Aliases: ptmvt
### Keywords: math multivariate

### ** Examples

sigma <- matrix(c(5, 0.8, 0.8, 1), 2, 2)
Fx <- ptmvt(lowerx=c(-1,-1), upperx=c(0.5,0), mean=c(0,0), sigma=sigma, df=3, 
  lower=c(-1,-1), upper=c(1,1))



