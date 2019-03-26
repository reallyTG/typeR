library(lmfor)


### Name: NRnum
### Title: Solve systems of equations using the Gauss-Newton algorithm
### Aliases: NRnum
### Keywords: numerical computations

### ** Examples

# Moment-based recovery of Weibull parameters
mu<-14
mu2<-210
muf<-function(theta) theta[2]*gamma(1+1/theta[1])-mu
mu2f<-function(theta) theta[2]^2*gamma(1+2/theta[1])-mu2
functions<-list(muf,mu2f)
momrec<-NRnum(c(3,13),functions)
momrec$par



