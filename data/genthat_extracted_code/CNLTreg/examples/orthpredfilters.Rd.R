library(CNLTreg)


### Name: orthpredfilters
### Title: Computes orthogonal filters
### Aliases: orthpredfilters
### Keywords: manip

### ** Examples


# create a vector representing a filter for one neighbour either side of a removed point
# (equally weighted):

L = c(0.5, 1, 0.5)

# now work out a unit-norm filter orthogonal to L

out <- orthpredfilters(L)

# M should be the second row:

out[2,]




