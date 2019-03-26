library(spam)


### Name: makeprec
### Title: Create Precision Matrices
### Aliases: precmat.GMRFreglat
### Keywords: array algebra

### ** Examples

as.matrix(precmat.GMRFreglat(4, 3, c(.4),         'm1p1'))
as.matrix(precmat.GMRFreglat(4, 3, c(.4,.3),      'm1p2'))
as.matrix(precmat.GMRFreglat(4, 3, c(.4,.3,.2),   'm2p3'))
as.matrix(precmat.GMRFreglat(4, 3, c(.4,.3,.2,.1),'m2p4'))

# up to the diagonal, the following are equivalent:
cleanup( precmat.IGMRFreglat(3,4) -
             precmat.GMRFreglat(3,4,1, 'm1p1'))




