library(scam)


### Name: smooth.construct.mdcv.smooth.spec
### Title: Constructor for monotone decreasing and concave P-splines in
###   SCAMs
### Aliases: smooth.construct.mdcv.smooth.spec
### Keywords: models regression

### ** Examples

  ## Not run: 
##D ## Monotone decreasing and concave P-splines example 
##D   ## simulating data...
##D    set.seed(2)
##D    n <- 100
##D    x <- sort(runif(n))
##D    f <- -x^4
##D    y <- f+rnorm(n)*0.10
##D    dat <- data.frame(x=x,y=y)
##D  ## fit model ...
##D    b <- scam(y~s(x,k=15,bs="mdcv",m=2),family=gaussian(link="identity"),data=dat)
##D 
##D # UNCONSTRAINED FIT *****************
##D    b1 <- scam(y~s(x,k=15,bs="ps",m=2),family=gaussian(link="identity"),data=dat)
##D 
##D ## plot results ...
##D    plot(x,y,xlab="x",ylab="y")
##D    lines(x,f)          ## the true function
##D    lines(x,b$fitted.values,col=2) ## mixed constrained fit 
##D    lines(x,b1$fitted.values,col=3) ## unconstrained fit 
##D   
## End(Not run)



