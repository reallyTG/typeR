library(neighbr)
context("utility functions")

test_that(".check_distance_inputs produces correct error messages", {
  expect_silent(.check_distance_inputs(c(0,1),c(1,2)))
})

test_that(".check_distance_inputs produces no messages for correct input", {
  expect_silent(.check_distance_inputs(c(0,1),c(1,2)))
})
