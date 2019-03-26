library(kernDeepStackNet)


### Name: kernDeepStackNet_crossprodRcpp
### Title: Calculates the cross product of a matrix
### Aliases: kernDeepStackNet_crossprodRcpp
### Keywords: models & regression

### ** Examples

A <- matrix(seq(-1, 1, length.out=9), nrow=3, ncol=3)
crossprodRcpp(A)[[1]]
all.equal(crossprodRcpp(A)[[1]], crossprod(A))



