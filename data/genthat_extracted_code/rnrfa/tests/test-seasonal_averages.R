context("test-seasonal_averages.R")

test_that("seasonal_averages works", {

  x <- seasonal_averages(cmr(18019), season = "Spring")
  expect_equal(length(x), 2)
  
  x <- seasonal_averages(list(cmr(18019), cmr(18019)), season = "Spring")
  expect_equal(length(x), 2)

})
