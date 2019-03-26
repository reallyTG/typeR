library(spam)


### Name: precmat
### Title: IGMRF Precision Matrices
### Aliases: precmat precmat.RW1 precmat.RW2 precmat.RWn precmat.season
###   precmat.IGMRFreglat precmat.IGMRFirreglat
### Keywords: algebra

### ** Examples

n <- 10
Q <- precmat.RW2( n)
# rmvnorm.prec(1, Q=Q) # does not work, because the matrix is singular.

Q



