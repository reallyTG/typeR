library(dae)


### Name: correct.degfree
### Title: Check the degrees of freedom in an object of class projector
### Aliases: correct.degfree
### Keywords: array projector

### ** Examples

## set up a 2 x 2 mean operator that takes the mean of a vector of 2 values
m <- matrix(rep(0.5,4), nrow=2)

## create a projector based on the matrix m
proj.m <- new("projector", data=m)

## add its degrees of freedom
degfree(proj.m) <- 1
    
## check degrees of freedom are correct
correct.degfree(proj.m)



