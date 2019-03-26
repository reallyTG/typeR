library(sde)


### Name: sdeAIC
### Title: Akaike's information criterion for diffusion processes
### Aliases: sdeAIC
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(123)
##D # true model generating data
##D dri <- expression(-(x-10))
##D dif <- expression(2*sqrt(x)) 
##D sde.sim(X0=10,drift=dri, sigma=dif,N=1000,delta=0.1) -> X
##D 
##D # we test the true model against two competing models
##D b <- function(x,theta) -theta[1]*(x-theta[2])
##D b.x <- function(x,theta)  -theta[1]+0*x
##D 
##D s <- function(x,theta) theta[3]*sqrt(x)
##D s.x <- function(x,theta) theta[3]/(2*sqrt(x))
##D s.xx <- function(x,theta) -theta[3]/(4*x^1.5)
##D # AIC for the true model
##D sdeAIC(X, NULL, b, s, b.x, s.x, s.xx, guess=c(1,1,1),
##D        lower=rep(1e-3,3), method="L-BFGS-B")
##D 
##D s <- function(x,theta) sqrt(theta[3]*+theta[4]*x)
##D s.x <- function(x,theta) theta[4]/(2*sqrt(theta[3]+theta[4]*x))
##D s.xx <- function(x,theta) -theta[4]^2/(4*(theta[3]+theta[4]*x)^1.5)
##D # AIC for competing model 1
##D sdeAIC(X, NULL, b, s, b.x, s.x, s.xx, guess=c(1,1,1,1),
##D        lower=rep(1e-3,4), method="L-BFGS-B")
##D 
##D s <- function(x,theta) (theta[3]+theta[4]*x)^theta[5]
##D s.x <- function(x,theta) 
##D            theta[4]*theta[5]*(theta[3]+theta[4]*x)^(-1+theta[5])
##D s.xx <- function(x,theta) (theta[4]^2*theta[5]*(theta[5]-1)
##D                  *(theta[3]+theta[4]*x)^(-2+theta[5]))
##D # AIC for competing model 2
##D sdeAIC(X, NULL, b, s, b.x, s.x, s.xx, guess=c(1,1,1,1,1),
##D        lower=rep(1e-3,5), method="L-BFGS-B")
## End(Not run)



