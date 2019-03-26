context("Fetch")

setAPIKey(readLines("./api-key.txt"))

test_that("fetchSeries object is as expected", {
  expect_equal(names(fetch_list$good), c("xts_object", "httr_response"))
  expect_equal(names(fetch_list$bad), c("xts_object", "httr_response"))
  expect_equal(fetch_list$bad$xts_object, "Bad response, error")
})

httptest::with_mock_API({
  test_that("fetchSeries mocked", {
    amzn <- fetchSeries(function_nm = "time_series_daily", symbol = "amzn", outputsize = "compact", datatype = "json")
    bad <- fetchSeries(function_nm = "time_series_daily", symbol = "mr_potato_head", outputsize = "compact", datatype = "json")
    expect_is(amzn, "list")
    expect_is(bad, "list")
    expect_equal(length(amzn), 2)
  })
})