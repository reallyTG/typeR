library(scam)


### Name: smooth.construct.tesmi2.smooth.spec
### Title: Tensor product smoothing constructor for a bivariate function
###   monotone increasing in the second covariate
### Aliases: smooth.construct.tesmi2.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ## tensor product `tesmi2' example 
##D   ## simulating data...
##D    set.seed(2)
##D    n <- 30
##D    x1 <- sort(runif(n))
##D    x2 <- sort(runif(n)*4-1)
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- 2*sin(pi*x1[i]) +exp(4*x2[j])/(1+exp(4*x2[j]))}
##D    f1 <- as.vector(t(f1))
##D    f <- (f1-min(f1))/(max(f1)-min(f1))
##D    y <- f+rnorm(length(f))*0.1
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D ## fit model ...
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs="tesmi2",m=2),
##D             family=gaussian(link="identity"), data=dat)
##D ## plot results ...
##D    par(mfrow=c(2,2),mar=c(4,4,2,2))
##D    plot(b,se=TRUE)
##D    plot(b,pers=TRUE, theta = 50, phi = 20) 
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data")
##D    x11()
##D    vis.scam(b,theta=50,phi=20)
##D  
## End(Not run)



