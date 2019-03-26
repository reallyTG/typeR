library(StableEstim)


### Name: CF Jacobian
### Title: Jacobian of the characteristic function of the stable law.
### Aliases: jacobianComplexCF
### Keywords: stable-functions

### ** Examples

# define the parameters
nt <- 10
t <- seq(0.1,3,length.out=nt)
theta <- c(1.5,0.5,1,0)
pm <- 0

# Compute the jacobian of the characteristic function
jack_CF <- jacobianComplexCF(t=t,theta=theta,pm=pm)



