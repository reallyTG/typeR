context("Weighted Quantile")
library(modi)

test_that("weighted.quantile equals quantile if weights are missing", {
  expect_equal(weighted.quantile(c(2,4,5), prob = 0.2), quantile(c(2,4,5), probs = 0.2))
})

test_that("weighted.quantile by default returns median", {
  expect_equal(weighted.quantile(c(2,4,5)), quantile(c(2,4,5), probs = 0.5))
})

test_that("weighted.quantile reacts correctly if x contains NA", {
  expect_equal(weighted.quantile(c(1,2,3,NA), c(1,2,1,1)), 2)
})

test_that("weighted.quantile produces warning if one obs. dominates", {
  expect_warning(weighted.quantile(c(2,4,5), c(3,1,1), prob = 0.5), "Dominance of one observation!")
})
