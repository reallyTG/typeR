library(scam)


### Name: smooth.construct.po.smooth.spec
### Title: Constructor for monotone increasing P-splines in SCAMs
### Aliases: smooth.construct.po.smooth.spec
### Keywords: models regression

### ** Examples

 
##  SCOP-splines example with positivity constraint... 
  ## simulating data...
## Not run: 
##D    set.seed(3)
##D    n <- 100
##D    x <- seq(-3,3,length.out=100)
##D    f <- dnorm(x) 
##D    y <- f + rnorm(n)*0.1  
##D    b <- scam(y~s(x,bs="po")-1)
##D   
##D    b1 <- scam(y~s(x)) ## unconstrained model
##D    plot(x,y)
##D    lines(x,f)
##D    lines(x,fitted(b),col=2)
##D    lines(x,fitted(b1),col=3)
##D 
##D   ## two-term example...
##D   set.seed(8)
##D   n <- 200
##D   x1 <- seq(-3,3,length.out=n)
##D   f1 <- 3*exp(-x1^2) ## positively constrained smooth
##D   x2 <- runif(n)*3-1;
##D   f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth 
##D   f <- f1+f2
##D   y <- f+rnorm(n)*0.3
##D   dat <- data.frame(x1=x1,x2=x2,y=y)
##D   ## fit model, results, and plot...
##D   b2 <- scam(y~s(x1,bs="po")+s(x2,k=15,bs="mpi")-1,data=dat)
##D   summary(b2)
##D   plot(b2,pages=1)
##D 
##D   b3 <- scam(y~s(x1,bs="ps")+s(x2,bs="ps"),data=dat) ## unconstrained model
##D   summary(b3)
##D   plot(b3,pages=1) 
##D  
## End(Not run) 



