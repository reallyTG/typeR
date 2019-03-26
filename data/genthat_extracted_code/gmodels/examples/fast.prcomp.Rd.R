library(gmodels)


### Name: fast.prcomp
### Title: Efficient computation of principal components and singular value
###   decompositions.
### Aliases: fast.prcomp fast.svd
### Keywords: multivariate algebra array

### ** Examples


  # create test matrix
  set.seed(4943546)
  nr <- 50
  nc <- 2000
  x  <- matrix( rnorm( nr*nc), nrow=nr, ncol=nc )
  tx <- t(x)

  # SVD directly on matrix is SLOW:
  system.time( val.x <- svd(x)$u )

  # SVD on t(matrix) is FAST:
  system.time( val.tx <- svd(tx)$v )

  # and the results are equivalent:
  max( abs(val.x) - abs(val.tx) )

  # Time gap dissapears using fast.svd:
  system.time( val.x <- fast.svd(x)$u )
  system.time( val.tx <- fast.svd(tx)$v )
  max( abs(val.x) - abs(val.tx) )


  library(stats)

  # prcomp directly on matrix is SLOW:
  system.time( pr.x <- prcomp(x) )

  # prcomp.fast is much faster
  system.time( fast.pr.x <- fast.prcomp(x) )

  # and the results are equivalent
  max( pr.x$sdev - fast.pr.x$sdev )
  max( abs(pr.x$rotation[,1:49]) - abs(fast.pr.x$rotation[,1:49]) )
  max( abs(pr.x$x) - abs(fast.pr.x$x)  )

  # (except for the last and least significant component):
  max( abs(pr.x$rotation[,50]) - abs(fast.pr.x$rotation[,50]) )



