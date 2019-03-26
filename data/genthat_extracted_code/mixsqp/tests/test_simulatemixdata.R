context("simulatemixdata")

test_that("simulatemixdata generates matrix with the correct dimensions",{
  dat <- simulatemixdata(1000,20)
  expect_equal(dim(dat$L),c(1000,20))
})
