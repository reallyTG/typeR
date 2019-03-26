context("URLs")

setAPIKey()

test_that("URL created as expected", {
  desired_url <- "https://www.alphavantage.co/query?function=SMA&symbol=MSFT&interval=30min&time_period=60&series_type=close&apikey=demo"
  url <- buildURL("sma", symbol = "msft", interval = "30min", time_period = 60, series_type = "close")
  expect_equal(desired_url, url)
  expect_error(buildURL("fsdklfjks"), "Invalid function_nm, must be in the list of available functions from Alpha Vantage documentation")
  expect_error(buildURL("sma", symbol = "msft"), "All required arguments not met, missing: interval, time_period, series_type$")
  expect_warning(buildURL("bbands", symbol = "msft", interval = "30min", time_period = 60, series_type = "close"),
                 "All optional arguments not met, missing: nbdevup, nbdevdn, matype$")
  expect_error(buildURL("time_series_daily"),
               "No additional arguments to function_nm, invalid query. Required args: symbol")
})