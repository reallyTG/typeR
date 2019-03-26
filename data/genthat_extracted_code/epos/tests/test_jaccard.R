library(epos)
context("test_jaccard")

test_that("Test jaccard if it calculates the correct jaccard coefficient", {
  expect_that(jaccard(1,3,3,4), equals(1-1/6))
})