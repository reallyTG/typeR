library(testthat)
context("feature computation")
library(PeakSegJoint)
data(H3K27ac.TDH.MMM4)

profile.list <- ProfileList(H3K27ac.TDH.MMM4)
profile.list$empty <-
  data.frame(chromStart=integer(),
             chromEnd=integer(),
             count=integer())

test_that("feature computation works for sample with no coverage rows", {
  fmat <- featureMatrixJoint(profile.list)
  expect_identical(rownames(fmat), names(profile.list))
})
