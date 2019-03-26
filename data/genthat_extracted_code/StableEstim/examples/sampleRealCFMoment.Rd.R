library(StableEstim)


### Name: sampleRealCFMoment
### Title: Real moment condition based on the characteristic function.
### Aliases: sampleRealCFMoment
### Keywords: stable-functions

### ** Examples

	## define the parameters
 nt <- 10   
 t <- seq(0.1,3,length.out=nt)
 theta <- c(1.5,0.5,1,0)
pm <- 0

set.seed(222);x=rstable(200,theta[1],theta[2],theta[3],theta[4],pm)

# Compute the characteristic function
CFMR <- sampleRealCFMoment(x=x,t=t,theta=theta,pm=pm)



