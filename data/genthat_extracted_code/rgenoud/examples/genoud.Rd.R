library(rgenoud)


### Name: genoud
### Title: GENetic Optimization Using Derivatives
### Aliases: genoud
### Keywords: optimize nonlinear

### ** Examples

#maximize the sin function
 sin1 <- genoud(sin, nvars=1, max=TRUE)

#minimize the sin function
 sin2 <- genoud(sin, nvars=1, max=FALSE)

## Not run: 
##D #maximize a univariate normal mixture which looks like a claw
##D  claw <- function(xx) {
##D    x <- xx[1]
##D    y <- (0.46*(dnorm(x,-1.0,2.0/3.0) + dnorm(x,1.0,2.0/3.0)) +
##D    (1.0/300.0)*(dnorm(x,-0.5,.01) + dnorm(x,-1.0,.01) + dnorm(x,-1.5,.01)) +
##D    (7.0/300.0)*(dnorm(x,0.5,.07) + dnorm(x,1.0,.07) + dnorm(x,1.5,.07))) 
##D    return(y)
##D  }
##D  claw1   <- genoud(claw, nvars=1,pop.size=3000,max=TRUE)
## End(Not run)

## Not run: 
##D #Plot the previous run
##D  xx <- seq(-3,3,.05)
##D  plot(xx,lapply(xx,claw),type="l",xlab="Parameter",ylab="Fit",
##D       main="GENOUD: Maximize the Claw Density")
##D  points(claw1$par,claw1$value,col="red")
##D 
##D # Maximize a bivariate normal mixture which looks like a claw.
##D  biclaw <- function(xx) {
##D   mNd2 <- function(x1, x2, mu1, mu2, sigma1, sigma2, rho)
##D     {
##D       z1 <- (x1-mu1)/sigma1
##D       z2 <- (x2-mu2)/sigma2
##D       w <- (1.0/(2.0*pi*sigma1*sigma2*sqrt(1-rho*rho))) 
##D       w <- w*exp(-0.5*(z1*z1 - 2*rho*z1*z2 + z2*z2)/(1-rho*rho)) 
##D       return(w)
##D     }
##D   x1 <- xx[1]+1
##D   x2 <- xx[2]+1
##D   
##D   y <- (0.5*mNd2(x1,x2,0.0,0.0,1.0,1.0,0.0) +
##D 	    0.1*(mNd2(x1,x2,-1.0,-1.0,0.1,0.1,0.0) +
##D 		 mNd2(x1,x2,-0.5,-0.5,0.1,0.1,0.0) +
##D 		 mNd2(x1,x2,0.0,0.0,0.1,0.1,0.0) +
##D 		 mNd2(x1,x2,0.5,0.5,0.1,0.1,0.0) +
##D 		 mNd2(x1,x2,1.0,1.0,0.1,0.1,0.0)))
##D 
##D   return(y)
##D  }
##D  biclaw1 <- genoud(biclaw, default.domains=20, nvars=2,pop.size=5000,max=TRUE)
## End(Not run)
# For more examples see: http://sekhon.berkeley.edu/rgenoud/R.



