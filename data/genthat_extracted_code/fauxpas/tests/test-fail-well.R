test_that("Error fails well", {
  skip_on_cran()

  expect_error(Error$new(name = "asdfdf"), "unused argument")

  expect_error(Error$new(a = 5), "unused argument")

  expect_error(Error$new(behavior = 5), "is not TRUE")

  expect_error(Error$new(behavior = "asdfadfs"),
               "'behavior' must be one of stop, warning, or message")
})
