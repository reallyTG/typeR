library(flexsurv)


### Name: unroll.function
### Title: Convert a function with matrix arguments to a function with
###   vector arguments.
### Aliases: unroll.function

### ** Examples


fn <- unroll.function(ncol, x=1:3)
fn(1:3, 1:3, 1:3) # equivalent to...
ncol(cbind(1:3,1:3,1:3))



