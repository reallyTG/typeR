library(tensorr)


### Name: sptensor
### Title: Construct a sparse tensor
### Aliases: sptensor sptensor,matrix,ANY,numeric-method
###   sptensor,matrix,missing,numeric-method
###   sptensor,list,ANY,numeric-method

### ** Examples

# A 2x2x2 sparse tensor
subs <- matrix(c(1,1,1, 1,1,2), c(3,2))
vals <- c(10,20)
dims <- c(2,2,2)
X <- sptensor(subs, vals, dims)




