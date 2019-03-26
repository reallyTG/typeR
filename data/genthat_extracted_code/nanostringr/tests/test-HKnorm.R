context("HKnorm")

data(ovd.r)

test_that("No error on either scale", {
  expect_error(HKnorm(ovd.r, is.logged = TRUE), NA)
  expect_error(HKnorm(ovd.r), NA)
})

test_that("Always returns data frame", {
  expect_is(HKnorm(ovd.r), "data.frame")
})
