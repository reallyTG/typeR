library(tmvtnorm)


### Name: ptmvnorm
### Title: Truncated Multivariate Normal Distribution
### Aliases: ptmvnorm
### Keywords: distribution multivariate

### ** Examples

 sigma <- matrix(c(5, 0.8, 0.8, 1), 2, 2)
 Fx <- ptmvnorm(lowerx=c(-1,-1), upperx=c(0.5,0), mean=c(0,0), 
   sigma=sigma, lower=c(-1,-1), upper=c(1,1))



