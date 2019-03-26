context("Bootstrap for prediction interval")

library(dplyr)

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))

test_that("bootstrap for prediction intervals works", {
  pmpp_model <- pmpp(dep_var = "emp", data = EmplUK)
  my_fframe <- create_fframe(EmplUK, 1983:1985)
  invisible(
    capture.output(
      intervals <- pmpp_predinterval(pmpp_model, my_fframe, boot_reps = 5)
    )
  )

  expect_true("data.frame" %in% class(intervals))
  expect_equal(colnames(intervals), c(
    "firm", "year", "lower_95",
    "upper_95", "midpoint"
  ))
  expect_true(is.numeric(intervals[, 3]))
  expect_true(is.numeric(intervals[, 4]))
  expect_true(is.numeric(intervals[, 5]))
  expect_true(all(intervals[, 3] <= intervals[, 4]))
})
