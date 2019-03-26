library(lmom)


### Name: cdfgno
### Title: Generalized normal distribution
### Aliases: cdfgno quagno
### Keywords: distribution

### ** Examples

# Random sample from the generalized normal distribution
# with parameters xi=0, alpha=1, k=-0.5.
quagno(runif(100), c(0,1,-0.5))

# The generalized normal distribution with parameters xi=1, alpha=1, k=-1,
# is the standard lognormal distribution.  An illustration:
fval<-seq(0.1,0.9,by=0.1)
cbind(fval, lognormal=qlnorm(fval), g.normal=quagno(fval, c(1,1,-1)))



