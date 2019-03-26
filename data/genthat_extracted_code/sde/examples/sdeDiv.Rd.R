library(sde)


### Name: sdeDiv
### Title: Phi-Divergences test for diffusion processes
### Aliases: sdeDiv
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(123)
##D theta0 <- c(0.89218*0.09045,0.89218,sqrt(0.032742))
##D theta1 <- c(0.89218*0.09045/2,0.89218,sqrt(0.032742/2))
##D 
##D # we test the true model against two competing models
##D b <- function(x,theta) theta[1]-theta[2]*x
##D b.x <- function(x,theta)  -theta[2]
##D 
##D s <- function(x,theta) theta[3]*sqrt(x)
##D s.x <- function(x,theta) theta[3]/(2*sqrt(x))
##D s.xx <- function(x,theta) -theta[3]/(4*x^1.5)
##D 
##D 
##D X <- sde.sim(X0=rsCIR(1, theta1), N=1000, delta=1e-3, model="CIR", 
##D  theta=theta1)
##D 
##D sdeDiv(X=X, theta0 = theta0,   b=b, s=s, b.x=b.x, s.x=s.x, 
##D  s.xx=s.xx, method="L-BFGS-B", 
##D  lower=rep(1e-3,3), guess=c(1,1,1))
##D 
##D sdeDiv(X=X, theta0 = theta1,   b=b, s=s, b.x=b.x, s.x=s.x, 
##D  s.xx=s.xx, method="L-BFGS-B", 
##D  lower=rep(1e-3,3), guess=c(1,1,1))
##D 
##D lambda <- -1.75
##D myphi <-  expression( (x^(lambda+1) -x - lambda*(x-1))/(lambda*(lambda+1)) )
##D 
##D sdeDiv(X=X, theta0 = theta0,   phi = myphi, b=b, s=s, b.x=b.x, 
##D  s.x=s.x, s.xx=s.xx, method="L-BFGS-B", 
##D  lower=rep(1e-3,3), guess=c(1,1,1))
##D 
##D sdeDiv(X=X, theta0 = theta1,   phi = myphi, b=b, s=s, b.x=b.x, 
##D  s.x=s.x, s.xx=s.xx, method="L-BFGS-B", 
##D  lower=rep(1e-3,3), guess=c(1,1,1))
## End(Not run)



