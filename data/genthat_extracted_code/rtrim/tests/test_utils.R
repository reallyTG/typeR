
context("Options")
test_that("options can be set",{
  set_trim_verbose(TRUE)
  expect_true(getOption("trim_verbose"))
  set_trim_verbose(FALSE)
  expect_false(getOption("trim_verbose"))

})

