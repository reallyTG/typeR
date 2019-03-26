library(sortinghat)


### Name: which_min
### Title: Helper function that determines which element in a vector is the
###   minimum. Ties can be broken randomly or via first/last ordering.
### Aliases: which_min

### ** Examples

set.seed(42)
z <- runif(5)
z <- c(z[1], z[1], z)

which_min(z)
which_min(z, break_ties = "first")
which_min(z, break_ties = "last")



