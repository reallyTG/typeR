
##

context("Parabolic weighting")

PWS <- function(n, verbose=FALSE){
  n <- as.integer(n)
  pw <- parabolic_weights_rcpp(n)
  pws. <- sum(pw[['taper_weights']])
  if (verbose) message(n," sums to ",pws.)
  return(pws.)
}

test_that("internal checks are working",{
  expect_error(PWS(-1))
  expect_error(PWS(1:2))
})

test_that("weights sum to 1 when n > 0",{
  expect_equal(PWS(0), 0)
  expect_equal(PWS(1), 1)
  expect_equal(PWS(10), 1)
  expect_equal(PWS(100), 1)
  expect_equal(PWS(1e3), 1)
  expect_equal(PWS(1e4), 1)
})


test_that("parabolic_weights_rcpp sum equals parabolic_weights_rcpp2 sum",{
  
  expect_equal(PWS(0),   sum(parabolic_weights_rcpp2(0)))
  expect_equal(PWS(1),   sum(parabolic_weights_rcpp2(1)))
  expect_equal(PWS(1e1), sum(parabolic_weights_rcpp2(1e1)))
  expect_equal(PWS(1e3), sum(parabolic_weights_rcpp2(1e3)))
  expect_equal(PWS(1e4), sum(parabolic_weights_rcpp2(1e4)))
  
})

##
