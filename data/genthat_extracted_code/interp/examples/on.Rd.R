library(interp)


### Name: on
### Title: Determines if a point is on or left of the vector described by
###   two other points.
### Aliases: on left
### Keywords: utilities

### ** Examples

y <- x <- c(0,1)
## should be TRUE
on(x[1],y[1],x[2],y[2],0.5,0.5)
## note the default setting of eps leading to
on(x[1],y[1],x[2],y[2],0.5,0.50000000000000001)
## also be TRUE

## should be TRUE
left(x[1],y[1],x[2],y[2],0.5,0.6)
## note the default setting of eps leading to
left(x[1],y[1],x[2],y[2],0.5,0.50000000000000001)
## already resulting to FALSE




