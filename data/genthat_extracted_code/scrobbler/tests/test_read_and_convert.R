context("Test read_ and time convert functions")

test_that("read_scrobbles throws error if convert_time is specified wrong", {
  expect_error(read_scrobbles(NA, convert_time = "Blob"),
               regexp = "Must be one of 'None', 'Date', 'Time'", fixed = TRUE)
})


test_that("Convert successfully converts to date and time", {
  expect_equal(convert("1522124746", to = "Date"),
               anytime::anydate("1522124746"))
  expect_equal(convert("1522124746", to = "Time", asUTC = TRUE),
               anytime::anytime("1522124746", asUTC = TRUE))
})
