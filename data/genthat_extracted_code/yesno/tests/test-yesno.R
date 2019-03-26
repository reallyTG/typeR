context("yesno")

test_that("question must be a string", {
  expect_error(yesno())
})
