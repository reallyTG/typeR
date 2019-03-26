library(bcv)


### Name: plot.cvsvd
### Title: Plot the Result of an SVD Cross-Validation
### Aliases: plot.cvsvd

### ** Examples

  # generate a rank-2 matrix plus noise
  n <- 50; p <- 20; k <- 2
  u <- matrix( rnorm( n*k ), n, k )
  v <- matrix( rnorm( p*k ), p, k )
  e <- matrix( rnorm( n*p ), n, p )
  x <- u %*% t(v) + e
  
  # perform 5-fold Wold-style cross-validtion
  cvw <- cv.svd.wold( x, 5, maxrank=10 )
  
  # perform (2,2)-fold Gabriel-style cross-validation
  cvg <- cv.svd.gabriel( x, 2, 2, maxrank=10 )
  
  # plot the results
  par( mfrow=c(2,1) )
  plot( cvw, main="Wold-style CV")
  plot( cvg, main="Gabriel-style CV")



