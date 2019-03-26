context("overlap")

test_that("overlap works", {
  set.seed(20150605)
  x <- list(X1=runif(1000),X2=runif(1000,.5,1.5))
  
  OV <- overlap(x, boundaries=list(from=c(0,.5),to=c(1,1.5)) )$OV
  expect_equal( object = as.numeric(OV), expected = 0.5, tolerance = .03, scale = 1 )
})
