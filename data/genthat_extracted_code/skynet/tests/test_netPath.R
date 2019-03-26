library(skynet)

context("Create Path Network")



test_that("make_net_path works", {
  # Run simple net test
  test <- make_net_path(OD_Sample)
  expect_length(test, 14)
  expect_output(str(nrow(test)), "2182")
})

test_that("make_net_path with leg", {
  # Run simple net test
  test <- make_net_path(OD_Sample, leg = TRUE)
  expect_length(test$netLegCount$legCount, 2749)
  expect_length(test$netLegCount, 5)
})

test_that("make_net_path with zero tickets", {
  # Run simple net test
  test <- make_net_path(OD_Sample, zero = TRUE)
  expect_length(test$pct_zero, 2182)
})

test_that("make_net_path with carriers", {
  # Run simple net test
  test <- make_net_path(OD_Sample, carrier = TRUE)
  expect_length(test$op_carrier, 2749)
})

