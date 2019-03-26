library(DPpackage)


### Name: PTsampler
### Title: Polya Tree sampler function
### Aliases: PTsampler PTsampler.default
### Keywords: models nonparametric

### ** Examples

## Not run: 
##D 
##D ###############################
##D # EXAMPLE 1 (Dog Bowl)
##D ###############################
##D 
##D # Target density
##D 
##D   target <- function(x,y)
##D   {
##D      out <- (-3/2)*log(2*pi)-0.5*(sqrt(x^2+y^2)-10)^2-
##D             0.5*log(x^2+y^2)
##D      exp(out)
##D   }	
##D 
##D   ltarget <- function(x)
##D   {
##D      out <- -0.5*((sqrt(x[1]^2+x[2]^2)-10)^2)-
##D              0.5*log(x[1]^2+x[2]^2)
##D      out
##D   }	
##D 
##D # MCMC
##D 
##D   mcmc <- list(nburn=5000,
##D                nsave=10000,
##D                ndisplay=500)
##D 
##D # Initial support points (optional)
##D 
##D   support <- cbind(rnorm(300,15,1),rnorm(300,15,1))
##D 
##D # Scanning the posterior
##D 
##D   fit <- PTsampler(ltarget,dim.theta=2,mcmc=mcmc,support=support)
##D 
##D   fit
##D   summary(fit)
##D   plot(fit,ask=FALSE)	
##D 
##D # Samples saved in 
##D # fit$save.state$thetasave
##D # Here is an example of how to use them
##D 	
##D   par(mfrow=c(1,2))
##D   plot(acf(fit$save.state$thetasave[,1],lag=100))
##D   plot(acf(fit$save.state$thetasave[,1],lag=100))
##D 	  
##D # Plotting resulting support points
##D 
##D   x1 <- seq(-15,15,0.2)	
##D   x2 <- seq(-15,15,0.2)	
##D   z <- outer(x1,x2,FUN="target")
##D   par(mfrow=c(1,1))
##D   image(x1,x2,z,xlab=expression(theta[1]),ylab=expression(theta[2]))
##D   points(fit$state$support,pch=19,cex=0.25)
##D 
##D # Plotting the samples from the target density
##D 
##D   par(mfrow=c(1,1))
##D   image(x1,x2,z,xlab=expression(theta[1]),ylab=expression(theta[2]))
##D   points(fit$save.state$thetasave,pch=19,cex=0.25)
##D 
##D # Re-starting the chain from the last sample
##D 
##D   state <- fit$state
##D   fit <- PTsampler(ltarget,dim.theta=2,mcmc=mcmc,
##D                    state=state,status=FALSE)
##D 
##D 
##D ###############################
##D # EXAMPLE 2 (Ping Pong Paddle)
##D ###############################
##D 
##D   bivnorm1 <- function(x1,x2)
##D   {
##D        eval <- (x1)^2+(x2)^2 
##D        logDET <-  0
##D        logPDF <- -(2*log(2*pi)+logDET+eval)/2
##D        out <- exp(logPDF)
##D        out
##D   }
##D 
##D   bivnorm2 <- function(x1,x2)
##D   {
##D        mu <- c(-3,-3)
##D        sigmaInv <- matrix(c(5.263158,-4.736842,
##D                            -4.736842,5.263158),
##D                             nrow=2,ncol=2)
##D        eval <- (x1-mu[1])^2*sigmaInv[1,1]+
##D                2*(x1-mu[1])*(x2-mu[2])*sigmaInv[1,2]+
##D                (x2-mu[2])^2*sigmaInv[2,2] 
##D        logDET <-  -1.660731
##D        logPDF <- -(2*log(2*pi)+logDET+eval)/2
##D        out <- exp(logPDF)
##D        out
##D   }
##D 
##D   bivnorm3 <- function(x1,x2)
##D   {
##D        mu <- c(2,2)
##D        sigmaInv <- matrix(c(5.263158,4.736842,
##D                             4.736842,5.263158),
##D                             nrow=2,ncol=2)
##D        eval <- (x1-mu[1])^2*sigmaInv[1,1]+
##D                2*(x1-mu[1])*(x2-mu[2])*sigmaInv[1,2]+
##D                (x2-mu[2])^2*sigmaInv[2,2] 
##D        logDET <-  -1.660731
##D        logPDF <- -(2*log(2*pi)+logDET+eval)/2
##D        out <- exp(logPDF)
##D        out
##D   }
##D 
##D   target <- function(x,y)
##D   {
##D      out <- 0.34*bivnorm1(x,y)+
##D 	    0.33*bivnorm2(x,y)+
##D 	    0.33*bivnorm3(x,y)
##D      out
##D   }	
##D 
##D   ltarget <- function(theta)
##D   {
##D      out <- 0.34*bivnorm1(x1=theta[1],x2=theta[2])+
##D 	    0.33*bivnorm2(x1=theta[1],x2=theta[2])+
##D 	    0.33*bivnorm3(x1=theta[1],x2=theta[2])
##D      log(out)
##D   }	
##D 
##D 
##D # MCMC
##D 
##D   mcmc <- list(nburn=5000,
##D                nsave=10000,
##D                ndisplay=500)
##D 
##D # Initial support points (optional)
##D 
##D   support <- cbind(rnorm(300,6,1),rnorm(300,6,1))
##D 
##D # Scanning the posterior
##D 
##D   fit <- PTsampler(ltarget,dim.theta=2,mcmc=mcmc,support=support)
##D 
##D   fit
##D   summary(fit)
##D   plot(fit,ask=FALSE)	
##D 
##D # Samples saved in 
##D # fit$save.state$thetasave
##D # Here is an example of how to use them
##D 	
##D   par(mfrow=c(1,2))
##D   plot(acf(fit$save.state$thetasave[,1],lag=100))
##D   plot(acf(fit$save.state$thetasave[,1],lag=100))
##D 	  
##D # Plotting resulting support points
##D 
##D   x1 <- seq(-6,6,0.05)	
##D   x2 <- seq(-6,6,0.05)	
##D   z <- outer(x1,x2,FUN="target")
##D   par(mfrow=c(1,1))
##D   image(x1,x2,z,xlab=expression(theta[1]),ylab=expression(theta[2]))
##D   points(fit$state$support,pch=19,cex=0.25)
##D 
##D # Plotting the samples from the target density
##D 
##D   par(mfrow=c(1,1))
##D   image(x1,x2,z,xlab=expression(theta[1]),ylab=expression(theta[2]))
##D   points(fit$save.state$thetasave,pch=19,cex=0.25)
##D 
##D 
## End(Not run)



