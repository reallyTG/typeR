library(sde)


### Name: HPloglik
### Title: Ait-Sahalia Hermite polynomial expansion approximation of the
###   likelihood
### Aliases: HPloglik
### Keywords: ts

### ** Examples

set.seed(123)
d <- expression(-1*x)
s <- expression(2) 
sde.sim(drift=d, sigma=s) -> X

M0 <- function(t, x, theta) -theta[1]*x
M1 <- function(t, x, theta) -theta[1]
M2 <- function(t, x, theta) 0
M3 <- function(t, x, theta) 0
M4 <- function(t, x, theta) 0
M5 <- function(t, x, theta) 0
M6 <- function(t, x, theta) 0
mu <- list(M0, M1, M2, M3, M4, M5, M6)

F <- function(t, x, theta) x/sqrt(theta[2])
S <- function(t, x, theta) sqrt(theta[2])

true.loglik <- function(theta) {
 DELTA <- deltat(X)
 lik <- 0
 for(i in 2:length(X))
  lik <- lik + dnorm(X[i], mean=X[i-1]*exp(-theta[1]*DELTA), 
   sd = sqrt((1-exp(-2*theta[1]*DELTA))*theta[2]/
             (2*theta[1])),TRUE)
 lik  
}

xx <- seq(-3,3,length=100)
sapply(xx, function(x) HPloglik(X,c(x,4),mu,F,S)) -> px
sapply(xx, function(x) true.loglik(c(x,4))) -> py

plot(xx,px,type="l",xlab=expression(beta),ylab="log-likelihood")
lines(xx,py, lty=3) # true



