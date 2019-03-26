library(pim)
context("pim environment")

test_that("Empty environment is created", {
  pimenv <- new.pim.env()
  expect_that(pimenv, is_a("pim.environment"))
})