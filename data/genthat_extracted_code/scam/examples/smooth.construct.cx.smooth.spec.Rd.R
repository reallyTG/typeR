library(scam)


### Name: smooth.construct.cx.smooth.spec
### Title: Constructor for convex P-splines in SCAMs
### Aliases: smooth.construct.cx.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D  
##D ## Convex P-splines example 
##D   ## simulating data...
##D    set.seed(1)
##D    n <- 100
##D    x <- sort(2*runif(n)-1)
##D    f <- 4*x^2
##D    y <- f + rnorm(n)*0.4
##D    dat <- data.frame(x=x,y=y)
##D    b <- scam(y~s(x,k=15,bs="cx",m=2),family=gaussian,data=dat,not.exp=FALSE)
##D    # UNCONSTRAINED FIT *****************
##D    b1 <- scam(y~s(x,k=15,bs="cr",m=2),family=gaussian, data=dat,not.exp=FALSE)
##D 
##D ## plot results ...
##D    plot(x,y,xlab="x",ylab="y")
##D    lines(x,f)      ## the true function
##D    lines(x,b$fitted,col=2)  ## constrained fit 
##D    lines(x,b1$fitted,col=3) ## unconstrained fit 
##D 
##D ## Poisson version...
##D    y <- rpois(n,exp(f))
##D    dat <- data.frame(x=x,y=y)
##D  ## fit model ...
##D    b <- scam(y~s(x,k=15,bs="cx",m=2),family=poisson(link="log"),data=dat,not.exp=FALSE)
##D 
##D # UNCONSTRAINED FIT *****************
##D    b1 <- scam(y~s(x,k=15,bs="cr",m=2),family=poisson(link="log"), data=dat,not.exp=FALSE)
##D 
##D ## plot results ...
##D    plot(x,y,xlab="x",ylab="y")
##D    lines(x,exp(f))      ## the true function
##D    lines(x,b$fitted,col=2)  ## constrained fit 
##D    lines(x,b1$fitted,col=3) ## unconstrained fit 
##D  
##D  
## End(Not run)



