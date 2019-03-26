library(scam)


### Name: smooth.construct.tecxcx.smooth.spec
### Title: Tensor product smoothing constructor for bivariate function
###   subject to double convexity constraint
### Aliases: smooth.construct.tecxcx.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ## tensor product `tecxcx' example 
##D   ## simulating data...
##D    set.seed(1)
##D    n <- 30
##D    x1 <- sort(2*runif(n)-1)
##D    x2 <- sort(2*runif(n)-1)
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- 2*(x1[i]^2 + x2[j]^2)}  
##D    f <- as.vector(t(f1))
##D    y <- f+rnorm(length(f))*.05
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D ## fit model ...
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs="tecxcx"), data=dat)
##D ## plot results ...
##D    par(mfrow=c(2,2),mar=c(4,4,2,2))
##D    plot(b,se=TRUE)
##D    plot(b,pers=TRUE,theta = 30, phi = 40)
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data")
##D    x11()
##D    vis.scam(b,theta=20,phi=20)
##D  
## End(Not run)



