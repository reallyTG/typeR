library(dae)


### Name: print.projector
### Title: Print projectors
### Aliases: print.projector print,projector-method
### Keywords: array projector

### ** Examples

## set up a 2 x 2 mean operator that takes the mean of a vector of 2 values
m <- matrix(rep(0.5,4), nrow=2)

## create an object of class projector
proj.m <- projector(m)

## print the object either using the Method function, the generic function or show
print.projector(proj.m)
print(proj.m)
proj.m



