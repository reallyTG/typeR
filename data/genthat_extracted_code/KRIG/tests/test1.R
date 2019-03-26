# Test 1 -------------------------------------------------------------------------------------------
context( "Distance function parallelization" )

test_that( "Same result sequencial and parallel code", {
  n<-1e5
  x<-runif( n )
  y<-runif( n )
  p<-rep(2.5,n)
  w<-runif(n)
  
  kw<-weight_pow_dist( x, y, w, p )
  
  nw<-sum( w * abs( x - y )^p )
  
  expect_equal( kw, nw )
} )

