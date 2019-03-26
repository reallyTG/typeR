library( testthat )


context("Data generation methods")

test_that("DGP works", {

  
  df = make.randomized.dat( 100, beta.vec=c(-1,-1,1), gamma.vec=c(1,1,1,1) )
  head( df )
  expect_equal( ncol( df ), 8 )
  
  df = make.randomized.dat( 100, beta.vec=c(0), gamma.vec=c(1,1,1,1) )
  head( df )
  expect_equal( ncol( df ), 8 )
  taus = df$Y.1 - df$Y.0
  expect_true( all( taus == 0 ) )
  
  df = make.randomized.dat( 100, beta.vec=c(1), gamma.vec=c(1,1,1) )
  head( df )
  expect_equal( ncol( df ), 7 )
  taus = df$Y.1 - df$Y.0
  taus
  expect_true( all( round( taus - 1, digits=10 ) == 0 ) )
  
  df = make.randomized.dat( 100, beta.vec=c(1,2), gamma.vec=c(1) )
  head( df )
  expect_equal( ncol( df ), 6 )
  expect_equal( names( df ), c("A","Y.0","Y.1","tau","Z","Yobs" ) )
  
  df = make.randomized.dat( 100, beta.vec=c(0), gamma.vec=c(0) )
  head( df )
  expect_equal( ncol( df ), 6 )
  expect_equal( names( df ), c("A","Y.0","Y.1","tau","Z","Yobs" ) )
  taus = df$Y.1 - df$Y.0
  taus
  expect_true( all( round( taus, digits=10 ) == 0 ) )
  
} )



