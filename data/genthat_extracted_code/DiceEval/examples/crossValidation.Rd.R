library(DiceEval)


### Name: crossValidation
### Title: K-fold Cross Validation
### Aliases: crossValidation
### Keywords: models

### ** Examples

## Not run: 
##D rm(list=ls())
##D # A 2D example
##D Branin <- function(x1,x2) {
##D   x1 <- x1*15-5   
##D   x2 <- x2*15
##D   (x2 - 5/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
##D }
##D 
##D # Linear model on 50 points
##D n <- 50
##D X <- matrix(runif(n*2),ncol=2,nrow=n)
##D Y <- Branin(X[,1],X[,2])
##D modLm <- modelFit(X,Y,type = "Linear",formula=Y~X1+X2+X1:X2+I(X1^2)+I(X2^2))
##D R2(Y,modLm$model$fitted.values)
##D crossValidation(modLm,K=10)$Q2
##D 
##D 
##D # kriging model : gaussian covariance structure, no trend, no nugget effect
##D # on 16 points 
##D n <- 16
##D X <- data.frame(x1=runif(n),x2=runif(n))
##D Y <- Branin(X[,1],X[,2])
##D mKm <- modelFit(X,Y,type="Kriging",formula=~1, covtype="powexp")
##D K <- 10
##D out   <- crossValidation(mKm, K)
##D par(mfrow=c(2,2))
##D plot(c(0,1:K),c(mKm$model@covariance@range.val[1],out$theta[,1]),
##D  	xlab='',ylab='Theta1')
##D  plot(c(0,1:K),c(mKm$model@covariance@range.val[2],out$theta[,2]),
##D  	xlab='',ylab='Theta2')
##D  plot(c(0,1:K),c(mKm$model@covariance@shape.val[1],out$shape[,1]),
##D  	xlab='',ylab='p1',ylim=c(0,2))
##D  plot(c(0,1:K),c(mKm$model@covariance@shape.val[2],out$shape[,2]),
##D  	xlab='',ylab='p2',ylim=c(0,2))
##D par(mfrow=c(1,1))
## End(Not run)



