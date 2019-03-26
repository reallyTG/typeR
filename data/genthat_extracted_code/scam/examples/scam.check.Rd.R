library(scam)


### Name: scam.check
### Title: Some diagnostics for a fitted scam object
### Aliases: scam.check
### Keywords: models smooth regression

### ** Examples

 ## Not run: 
##D library(scam)
##D set.seed(2)
##D n <- 200
##D x1 <- runif(n)*4-1;
##D f1 <- exp(4*x1)/(1+exp(4*x1)) # monotone increasing smooth
##D x2 <- runif(n)*3-1;
##D f2 <- exp(-3*x2)/15  # monotone decreasing and convex smooth
##D f <- f1+f2
##D y <- f+ rnorm(n)*0.2
##D dat <- data.frame(x1=x1,x2=x2,y=y)
##D b <- scam(y~ s(x1,k=25,bs="mpi",m=2)+s(x2,k=25,bs="mdcx",m=2),
##D     family=gaussian(link="identity"),data=dat)
##D plot(b,pages=1)
##D scam.check(b,pch=19,cex=.3)
##D  
## End(Not run)



