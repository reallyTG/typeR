library(scam)


### Name: smooth.construct.micx.smooth.spec
### Title: Constructor for monotone increasing and convex P-splines in
###   SCAMs
### Aliases: smooth.construct.micx.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ## Monotone increasing and convex P-splines example 
##D   ## simulating data...
##D    set.seed(22)
##D    n <- 100
##D    x <- runif(n)*2
##D    f <- x^2
##D    y <- rpois(n,exp(f))
##D    dat <- data.frame(x=x,y=y)
##D  ## fit model ...
##D    b <- scam(y~s(x,k=15,bs="micx",m=2),family=poisson(link="log"),
##D        data=dat,sp=NULL,not.exp=FALSE)
##D 
##D # UNCONSTRAINED FIT *****************
##D    b1 <- scam(y~s(x,k=15,bs="cr",m=2),family=poisson(link="log"),
##D          data=dat,sp=NULL)
##D 
##D ## plot results ...
##D    plot(x,y,xlab="x",ylab="y")
##D    x1 <- sort(x,index=TRUE)
##D    lines(x1$x,exp(f)[x1$ix])      ## the true function
##D    lines(x1$x,b$fitted.values[x1$ix],col=2)  ## mixed constrained fit 
##D    lines(x1$x,b1$fitted.values[x1$ix],col=3) ## unconstrained fit 
##D  
## End(Not run)



