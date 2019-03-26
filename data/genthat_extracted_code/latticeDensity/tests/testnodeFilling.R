library(testthat)
library(latticeDensity)

context("Proper functioning of nodeFilling")

sqr_poly <- cbind(c(0,1,1,0),c(0,0,1,1))
nodeFillingOutput <- nodeFilling(sqr_poly,0.2)
test_that("correct output with simple input",{
  expect_equal(length(nodeFillingOutput$EW_locs), 5)
  expect_equal(length(nodeFillingOutput$NS_locs), 5)
  expect_equal(nodeFillingOutput$EW_locs,c(0.1, 0.3, 0.5, 0.7, 0.9))
})
