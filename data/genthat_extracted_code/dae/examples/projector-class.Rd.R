library(dae)


### Name: projector-class
### Title: Class projector
### Aliases: projector-class coerce,projector,matrix-method
###   coerce<-,projector,matrix-method
### Keywords: classes array projector

### ** Examples

showClass("projector")

## set up a 2 x 2 mean operator that takes the mean of a vector of 2 values
m <- matrix(rep(0.5,4), nrow=2)

## create an object of class projector
proj.m <- projector(m)

## check that it is a valid projector
is.projector(proj.m)

## create a projector based on the matrix m
proj.m <- new("projector", data=m)

## add its degrees of freedom and print the projector
degfree(proj.m) <- proj.m



