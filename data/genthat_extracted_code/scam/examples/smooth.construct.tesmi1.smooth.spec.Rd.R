library(scam)


### Name: smooth.construct.tesmi1.smooth.spec
### Title: Tensor product smoothing constructor for a bivariate function
###   monotone increasing in the first covariate
### Aliases: smooth.construct.tesmi1.smooth.spec
### Keywords: models regression

### ** Examples

  ## Not run: 
##D ## tensor product `tesmi1' example 
##D   ## simulating data...
##D    set.seed(2)
##D    n <- 30
##D    x1 <- sort(runif(n)*4-1)
##D    x2 <- sort(runif(n))
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- exp(4*x1[i])/(1+exp(4*x1[i]))+2*sin(pi*x2[j])}
##D    f <- as.vector(t(f1))
##D    y <- f+rnorm(length(f))*0.1
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D ## fit model ...
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs="tesmi1",m=2), data=dat,sp=NULL)
##D ## plot results ...
##D    par(mfrow=c(2,2))
##D    plot(b,se=TRUE)
##D    plot(b,pers=TRUE,theta = 30, phi = 40)
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data")
##D  
## End(Not run)



