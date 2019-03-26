library(nimble)


### Name: nimDim
### Title: return sizes of an object whether it is a vector, matrix or
###   array
### Aliases: dim nimDim

### ** Examples

x <- rnorm(4)
dim(x)
nimDim(x)
y <- matrix(x, nrow = 2)
dim(y)
nimDim(y)




