context("options")


test_that("options works", {
  rgho:::.onLoad()

  expect_false(
    options()$rgho.verbose
  )
  expect_equal(
    options()$rgho.retry, 5
  )
  expect_equal(
    options()$rgho.memotime, 3600
  )
})
