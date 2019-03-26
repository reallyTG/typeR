context("input_errors")

test_that("only accepts numeric values", {
  expect_error(meditations(number = as.factor(state.name)))
  expect_error(meditations(number = data.frame(test = 1)))
  expect_error(meditations(number = as.Date("2001/01/01")))
  expect_error(meditations(number = "abc"))
  expect_error(meditations(number = "1"))
})

test_that("only accepts values between 1 and 507", {
  expect_error(meditations(number = 508))
  expect_error(meditations(number = 0))
  expect_error(meditations(number = -1))
  expect_error(meditations(number = 507.5))
  expect_error(meditations(number = 100000000000000000000))
  expect_error(meditations(number = c(0, 5)))
  expect_error(meditations(number = -1:3))
  expect_error(meditations(number = c("hello", 201:203)))
})

test_that("number between 1 and 507 works", {
  expect_silent(meditations(number = 1))
  expect_silent(meditations(number = 2))
  expect_silent(meditations(number = 507))
  expect_silent(meditations())
  expect_silent(meditations(number = 200))
  expect_silent(meditations(number = 200:205))
  expect_silent(meditations(number = c(1, 3, 200)))
})
