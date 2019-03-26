library(mixtools)


### Name: rmvnormmix
### Title: Simulate from Multivariate (repeated measures) Mixtures of
###   Normals
### Aliases: normmixrm.sim rmvnormmix
### Keywords: file

### ** Examples

##Generate data from a 2-component mixture of trivariate normals.

set.seed(100)
n <- 200
lambda <- rep(1, 2)/2
mu <- matrix(2*(1:6), 2, 3)
sigma <- matrix(1,2,3)
mydata<-rmvnormmix(n, lambda, mu, sigma)

## Now check to see if we can estimate mixture densities well:
title <- paste("Does this resemble N(", mu[1,], ",1) and N(", mu[2,],",1)?",
                sep="")
plot(npEM(mydata, 2), title=title)



