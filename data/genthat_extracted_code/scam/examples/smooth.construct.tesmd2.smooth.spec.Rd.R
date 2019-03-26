library(scam)


### Name: smooth.construct.tesmd2.smooth.spec
### Title: Tensor product smoothing constructor for a bivariate function
###   monotone decreasing in the second covariate
### Aliases: smooth.construct.tesmd2.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ## tensor product `tesmd2' example 
##D   ## simulating data...
##D    set.seed(2)
##D    n <- 30
##D    x1 <- sort(runif(n)*4-1)
##D    x2 <- sort(runif(n))
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- exp(4*x1[i])/(1+exp(4*x1[i])) - 2*exp(x2[j]-0.5)}
##D    f <- as.vector(t(f1))
##D    y <- f+rnorm(length(f))*0.1
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D ## fit model ...
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs="tesmd2",m=2),data=dat,sp=NULL)
##D ## plot results ...
##D    par(mfrow=c(2,2),mar=c(4,4,2,2))
##D    plot(b,se=TRUE)
##D    plot(b,pers=TRUE,theta = 90, phi = 60)
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data")
##D    x11()
##D    vis.scam(b,theta = 90, phi = 60)
##D  
## End(Not run)



