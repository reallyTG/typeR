library(kernlab)


### Name: rvm-class
### Title: Class "rvm"
### Aliases: rvm-class RVindex mlike nvar RVindex,rvm-method
###   alpha,rvm-method cross,rvm-method error,rvm-method kcall,rvm-method
###   kernelf,rvm-method kpar,rvm-method lev,rvm-method mlike,rvm-method
###   nvar,rvm-method type,rvm-method xmatrix,rvm-method ymatrix,rvm-method
### Keywords: classes

### ** Examples


# create data
x <- seq(-20,20,0.1)
y <- sin(x)/x + rnorm(401,sd=0.05)

# train relevance vector machine
foo <- rvm(x, y)
foo

alpha(foo)
RVindex(foo)
fitted(foo)
kernelf(foo)
nvar(foo)

## show slots
slotNames(foo)




