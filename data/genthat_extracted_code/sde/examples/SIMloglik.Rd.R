library(sde)


### Name: SIMloglik
### Title: Pedersen's approximation of the likelihood
### Aliases: SIMloglik
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(123)
##D d <- expression(-1*x)
##D s <- expression(2) 
##D sde.sim(drift=d, sigma=s,N=50,delta=0.01) -> X
##D 
##D S <- function(t, x, theta) sqrt(theta[2])
##D B <- function(t, x, theta) -theta[1]*x
##D 
##D true.loglik <- function(theta) {
##D  DELTA <- deltat(X)
##D  lik <- 0
##D  for(i in 2:length(X))
##D   lik <- lik + dnorm(X[i], mean=X[i-1]*exp(-theta[1]*DELTA), 
##D    sd = sqrt((1-exp(-2*theta[1]*DELTA))*
##D               theta[2]/(2*theta[1])),TRUE)
##D  lik  
##D }
##D 
##D xx <- seq(-10,10,length=20)
##D sapply(xx, function(x) true.loglik(c(x,4))) -> py
##D sapply(xx, function(x) EULERloglik(X,c(x,4),B,S)) -> pz
##D sapply(xx, function(x) SIMloglik(X,c(x,4),B,S,M=10000,N=5)) -> pw
##D 
##D plot(xx,py,type="l",xlab=expression(beta),
##D    ylab="log-likelihood",ylim=c(0,15)) # true
##D lines(xx,pz, lty=2) # Euler
##D lines(xx,pw, lty=3) # Simulated
## End(Not run)


