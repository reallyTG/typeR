library(iterators)


### Name: iapply
### Title: Array/Apply Iterator
### Aliases: iapply
### Keywords: utilities

### ** Examples

a <- array(1:8, c(2, 2, 2))

# iterate over all the matrices
it <- iapply(a, 3)
as.list(it)

# iterate over all the columns of all the matrices
it <- iapply(a, c(2, 3))
as.list(it)

# iterate over all the rows of all the matrices
it <- iapply(a, c(1, 3))
as.list(it)



