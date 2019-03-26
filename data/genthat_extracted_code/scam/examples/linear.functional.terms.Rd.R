library(scam)


### Name: linear.functional.terms
### Title: Linear functionals of a smooth in GAMs
### Aliases: linear.functional.terms function.predictors signal.regression
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ###########################################
##D ## similar to a "signal" regression 
##D ## example from mgcv() ...
##D ###########################################
##D library(scam)
##D ## decreasing smooth...
##D set.seed(4)
##D rf <- function(x=seq(-1,3,length=100)) {
##D ## generates random functions...
##D   m <- ceiling(runif(1)*5) ## number of components
##D   f <- x*0;
##D   mu <- runif(m,min(x),max(x));sig <- (runif(m)+.5)*(max(x)-min(x))/10
##D   for (i in 1:m) f <- f+ dnorm(x,mu[i],sig[i])
##D   f
##D }
##D 
##D ## simulate 200 functions and store in rows of L...
##D L <- matrix(NA,200,100) 
##D for (i in 1:200) L[i,] <- rf()  ## simulate the functional predictors
##D 
##D x <- seq(-1,3,length=100) ## evaluation points
##D f2 <- function(x) { ## the coefficient function
##D      -4*exp(4*x)/(1+exp(4*x))  
##D }
##D f <- f2(x) 
##D plot(x,f ,type="l")
##D y <- L##D 
##D X <- matrix(x,200,100,byrow=TRUE) 
##D 
##D b <- scam(y~s(X,by=L,k=20,bs="mpd")) 
##D par(mfrow=c(1,1))
##D plot(b,shade=TRUE);lines(x,f,col=2); 
##D ## compare with gam() of mgcv package...
##D g <- gam(y~s(X,by=L,k=20)) 
##D x11()
##D par(mfrow=c(1,1))
##D plot(g,shade=TRUE);lines(x,f,col=2)
##D 
##D 
##D ## increasing smooth....
##D x <- seq(-1,3,length=100) ## evaluation points
##D f2 <- function(x) { ## the coefficient function
##D      4*exp(4*x)/(1+exp(4*x))  
##D }
##D f <- f2(x) 
##D plot(x,f ,type="l")
##D y <- L##D 
##D X <- matrix(x,200,100,byrow=TRUE) 
##D 
##D b <- scam(y~s(X,by=L,k=20,bs="mpi")) 
##D par(mfrow=c(1,1))
##D plot(b,shade=TRUE);lines(x,f,col=2); 
##D 
##D g <- gam(y~s(X,by=L,k=20)) 
##D x11()
##D par(mfrow=c(1,1))
##D plot(g,shade=TRUE);lines(x,f,col=2)
##D 
##D  
## End(Not run)



