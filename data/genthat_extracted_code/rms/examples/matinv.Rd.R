library(rms)


### Name: matinv
### Title: Total and Partial Matrix Inversion using Gauss-Jordan Sweep
###   Operator
### Aliases: matinv
### Keywords: array

### ** Examples

a      <- diag(1:3)
a.inv1 <- matinv(a, 1, negate=FALSE)	     #Invert with respect to a[1,1]
a.inv1
a.inv  <- -matinv(a.inv1, 2:3, negate=FALSE) #Finish the job
a.inv
solve(a)



