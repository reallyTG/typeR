context("test plot_trend")

x1 <- model_trend_ex[, -3]
x2 <- model_trend_ex[, -7]
x3 <- model_trend_ex
x3$pred <- as.character(x3$pred)
x4 <- as.list(model_trend_ex)

test_that("test error messages", {
  # missing argument
  expect_error(plot_trend(), "Argument trend_tbl is missing")
  # not all variables needed are provided in input:
  expect_error(plot_trend(trend_tbl = x1), "The following variables ")
  expect_error(plot_trend(trend_tbl = x2), "The following variables ")
  # data type is not as required (indication of
  # modification)
  expect_error(plot_trend(x3))
  # input not a tibble anymore
  expect_error(plot_trend(x4), "trend_tbl has to be a tibble")
})
