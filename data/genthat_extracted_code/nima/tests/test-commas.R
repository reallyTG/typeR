library(nima)
context("Checking insertion of commas in large numbers")

test_that("commas edits a single large number as expected", {
  expect_equal(commas(3007005), "3,007,005")
})

test_that("commas edits vectors of large numbers appropriately", {
  expect_equal(commas(c(2000, 5000, 10000)), c("2,000", "5,000", "10,000"))
})
