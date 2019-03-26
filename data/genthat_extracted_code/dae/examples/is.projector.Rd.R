library(dae)


### Name: is.projector
### Title: Tests whether an object is a valid object of class projector
### Aliases: is.projector
### Keywords: array projector

### ** Examples

## set up a 2 x 2 mean operator that takes the mean of a vector of 2 values
m <- matrix(rep(0.5,4), nrow=2)

## create an object of class projector
proj.m <- projector(m)

## check that it is a valid projector
is.projector(proj.m)



