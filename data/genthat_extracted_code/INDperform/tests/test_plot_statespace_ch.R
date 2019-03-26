context("test plot_statespace_ch")

# Test data input validation
test_that("test error messages", {
  expect_error(plot_statespace_ch(), "Argument x is missing")
  expect_error(plot_statespace_ch(x = 1:10), "x has to be a list")
})
