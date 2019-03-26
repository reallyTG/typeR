context("Weighted Variance")
library(modi)

test_that("weighted.var throws errors when necessary", {
  expect_error(weighted.var(c(2,4,5), c(1,2)), "x and w must have the same length")
  expect_error(weighted.var(c(2,4,5), c(1,2,-1)), "there are negative weights")
})

test_that("weighted.var equals var if weights are missing", {
  expect_equal(weighted.var(c(2,4,5)), var(c(2,4,5)))
})

test_that("weighted.var reacts correctly if x contains NA", {
  expect_equal(weighted.var(c(1,2,3,NA), c(1,2,1,1), na.rm = FALSE), NA_integer_)
  expect_equal(weighted.var(c(1,2,3,NA), c(1,2,1,1), na.rm = TRUE), 0.75)
})

#test_that("weighted.var reacts correctly if w contains NA", {
#  expect_equal(weighted.var(c(1,2,3,2), c(NA,2,1,1), na.rm = FALSE), NA_integer_)
#  expect_equal(weighted.var(c(1,2,3,2), c(NA,2,1,1), na.rm = TRUE), 0.28125)
#})
