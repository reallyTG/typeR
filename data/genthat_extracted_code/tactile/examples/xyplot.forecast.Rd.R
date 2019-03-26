library(tactile)


### Name: xyplot.forecast
### Title: Plot Forecasts with Trellis Graphics
### Aliases: xyplot.forecast

### ** Examples

if (require(forecast)) {
  train <- window(USAccDeaths, c(1973, 1), c(1977, 12))
  test <- window(USAccDeaths, c(1978, 1), c(1978, 12))
  fit <- arima(train, order = c(0, 1, 1),
               seasonal = list(order = c(0, 1, 1)))
  fcast1 <- forecast(fit, 12)
  xyplot(fcast1, test, grid = TRUE, auto.key = list(corner = c(0, 0.99)),
         ci_key = list(title = "PI Level"))

  # A fan plot
  fcast2 <- forecast(fit, 12, level = seq(0, 95, 10))
  xyplot(fcast2, test, ci_pal = heat.colors(100))
}



