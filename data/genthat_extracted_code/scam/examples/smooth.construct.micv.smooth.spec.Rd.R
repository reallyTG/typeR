library(scam)


### Name: smooth.construct.micv.smooth.spec
### Title: Constructor for monotone increasing and concave P-splines in
###   SCAMs
### Aliases: smooth.construct.micv.smooth.spec
### Keywords: models regression

### ** Examples

 ## Not run: 
##D ## Monotone increasing and concave P-splines example 
##D   ## simulating data...
##D    set.seed(3)
##D    n <- 100
##D    x <- sort(runif(n)*99+1)
##D    f1 <- log(x)
##D    f <- (f1-min(f1))/(max(f1)-min(f1))
##D    y <- f+rnorm(n)*0.10
##D    dat <- data.frame(x=x,y=y)
##D  ## fit model ...
##D    b <- scam(y~s(x,k=15,bs="micv",m=2), data=dat)
##D 
##D # UNCONSTRAINED FIT *****************
##D    b1 <- scam(y~s(x,k=15,bs="ps",m=2),data=dat)
##D 
##D ## plot results ...
##D    plot(x,y,xlab="x",ylab="y")
##D    lines(x,f)           ## the true function
##D    lines(x,b$fitted.values,col=2)  ## mixed constrained fit 
##D    lines(x,b1$fitted.values,col=3) ## unconstrained fit 
##D   
## End(Not run)



