library(epos)
context("test_cosine")

test_that("Test cosine if it calculates the correct cosine coefficient", {
  expect_that(cosine(1,2,3), equals(1 - 0.4082483))
})