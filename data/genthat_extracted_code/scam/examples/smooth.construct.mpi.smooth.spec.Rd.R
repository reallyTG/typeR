library(scam)


### Name: smooth.construct.mpi.smooth.spec
### Title: Constructor for monotone increasing P-splines in SCAMs
### Aliases: smooth.construct.mpi.smooth.spec
### Keywords: models regression

### ** Examples

 
## Monotone increasing P-splines example 
  ## simulating data...
   set.seed(12)
   n <- 100
   x <- runif(n)*4-1
   f <- 4*exp(4*x)/(1+exp(4*x))
   y <- rpois(n,exp(f))
   dat <- data.frame(x=x,y=y)
 ## fit model ...
   b <- scam(y~s(x,k=15,bs="mpi",m=2),family=poisson(link="log"),
       data=dat,sp=NULL)

# UNCONSTRAINED FIT *****************
   b1 <- scam(y~s(x,k=15,bs="ps",m=2),family=poisson(link="log"),
         data=dat,sp=NULL)

## plot results ...
   plot(x,y,xlab="x",ylab="y")
   x1 <- sort(x,index=TRUE)
   lines(x1$x,exp(f)[x1$ix])      ## the true function
   lines(x1$x,b$fitted.values[x1$ix],col=2)  ## monotone fit 
   lines(x1$x,b1$fitted.values[x1$ix],col=3) ## unconstrained fit 

## example with supplied knots...
   knots <- list(x=c (-1.5,  -1.2, -.99, -.97, -.7, -.5, -.3, 0, 0.7,  
           0.9,1.1, 1.22,1.5,2.2,2.77,2.93,2.99, 3.2,3.6))
   b2 <- scam(y~s(x,k=15,bs="mpi",m=2),knots=knots, 
          family=poisson(link="log"), data=dat)
   summary(b2)
   plot(b2)

## Not run: 
##D ## example with two terms...
##D    set.seed(0)
##D    n <- 200
##D    x1 <- runif(n)*6-3
##D    f1 <- 3*exp(-x1^2) # unconstrained term
##D    x2 <- runif(n)*4-1;
##D    f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
##D    f <- f1+f2
##D    y <- f+rnorm(n)*0.1
##D    dat <- data.frame(x1=x1,x2=x2,y=y)
##D    knots <- list(x1=c(-4,-3.5,-2.99,-2.7,-2.5,-1.9,-1.1,-.9,-.3,0.3,.8,1.2,1.9,2.3,
##D 2.7,2.99,3.5,4.1), x2=c(-1.5,-1.2,-1.1, -.89,-.69,-.5,-.3,0,0.7, 
##D 0.9,1.1,1.22,1.5,2.2,2.77,2.99,3.1, 3.2,3.6))
##D    b3 <- scam(y~s(x1,k=15,bs="bs",m=2)+s(x2,bs="mpi", k=15,m=2), 
##D          knots=knots,data=dat)
##D   
##D ## setting knots for f(x2) only...
##D    knots <- list(x2=c(-1.5,-1.2,-1.1, -.89,-.69,-.5,-.3,
##D    0,0.7,0.9,1.1,1.22,1.5,2.2,2.77,2.99,3.1, 3.2,3.6))
##D    b4 <- scam(y~s(x1,k=15,bs="bs")+s(x2,bs="mpi", k=15),
##D        knots=knots,data=dat)
##D  
## End(Not run)



