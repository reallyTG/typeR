library(tactile)

test_that("xyplot.Arima works", {
  fit <- arima(lh, c(0, 0, 1))
  expect_error(xyplot(fit, which = 1:5))
  expect_error(xyplot(fit, main = letters[1:5]))
})

test_that("xyplot.forecast works", {
  if (require(forecast)) {
    fit <- forecast::forecast(arima(lh, c(0, 0, 1)))
    expect_error(dont_plot(fit), NA)
  }
})

