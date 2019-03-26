library(fda)


### Name: quadset
### Title: Quadrature points and weights for Simpson's rule
### Aliases: quadset
### Keywords: smooth

### ** Examples

(qs7.1 <- quadset(nquad=7, breaks=c(0, .3, 1)))
# cbind(quadpts=c(seq(0, 0.3, length=7),
#              seq(0.3, 1, length=7)),
#    quadwts=c((0.3/18)*c(1, 4, 2, 4, 2, 4, 1),
#              (0.7/18)*c(1, 4, 2, 4, 2, 4, 1) ) )

# The simplest basis currently available with this function:
bspl2.2 <- create.bspline.basis(norder=2, breaks=c(0,.5, 1))

bspl2.2a <- quadset(basisobj=bspl2.2)
bspl2.2a$quadvals
# cbind(quadpts=c((0:4)/8, .5+(0:4)/8),
#       quadwts=rep(c(1,4,2,4,1)/24, 2) )
bspl2.2a$values
# a list of length 2
# [[1]] = matrix of dimension c(10, 3) with the 3 basis
#      functions evaluated at the 10 quadrature points:
# values[[1]][, 1] = c(1, .75, .5, .25, rep(0, 6))
# values[[1]][, 2] = c(0, .25, .5, .75, 1, .75, .5, .25, 0)
# values[[1]][, 3] = values[10:1, 1]
#
# values[[2]] = matrix of dimension c(10, 3) with the
#     first derivative of values[[1]], being either
#    -2, 0, or 2.



