library(StableEstim)


### Name: ComplexCF
### Title: The characteristic function of the stable law
### Aliases: ComplexCF
### Keywords: stable-functions

### ** Examples

# define the parameters
nt <- 10
t <- seq(0.1,3,length.out=nt)
theta <- c(1.5,0.5,1,0)
pm <- 0

# Compute the characteristic function
CF <- ComplexCF(t=t,theta=theta,pm=pm)




