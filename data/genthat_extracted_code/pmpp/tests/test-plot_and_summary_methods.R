context("Plot & Summary methods")

library(dplyr)

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))

test_that("plot method works", {
  model <- pmpp(dep_var = "emp", data = EmplUK)
  myplot <- plot(model)

  expect_true("ggplot" %in% class(myplot))
})

test_that("summary method works", {
  model <- pmpp(dep_var = "emp", data = EmplUK)
  invisible(
    capture.output(
      mysummary <- summary(model)
    )
  )

  expect_true("data.frame" %in% class(mysummary))
  expect_equal(
    as.vector(mysummary[[1]]),
    c(
      "RMSE (in-sample):", "MAPE (in-sample):",
      "Residuals normality p-value (H0: normal):"
    )
  )
})
