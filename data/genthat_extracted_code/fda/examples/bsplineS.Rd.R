library(fda)


### Name: bsplineS
### Title: B-spline Basis Function Values
### Aliases: bsplineS
### Keywords: smooth

### ** Examples

# Minimal example:  A B-spline of order 1 (i.e., a step function)
# with 0 interior knots:
bS <- bsplineS(seq(0, 1, .2), 0:1, 1, 0)

# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bS, matrix(1, 6))
## Don't show: 
)
## End(Don't show)

#  set up break values at 0.0, 0.2,..., 0.8, 1.0.
breaks <- seq(0,1,0.2)
#  set up a set of 11 argument values
x <- seq(0,1,0.1)
#  the order willl be 4, and the number of basis functions
#  is equal to the number of interior break values (4 here)
#  plus the order, for a total here of 8.
norder <- 4
#  compute the 11 by 8 matrix of basis function values
basismat <- bsplineS(x, breaks, norder)

# use sparse Matrix representation to save memory
Basismat <- bsplineS(x, breaks, norder, returnMatrix=TRUE)

# check
## Don't show: 
stopifnot(
## End(Don't show)
class(Basismat)=='dgCMatrix'
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(basismat, as.matrix(Basismat))
## Don't show: 
)
## End(Don't show)




