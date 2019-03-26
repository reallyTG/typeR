library(tensorA)


### Name: is.tensor
### Title: Checking for being a tensor
### Aliases: is.tensor
### Keywords: arith

### ** Examples

A <- matrix(1:9,nrow=3)
is.tensor(A) # no
A <- to.tensor(A)
is.tensor(A) # yes



