message("\nTesting get_series_size")

test_that("Structure of series size value", {
  skip_on_cran()
  series_size <- get_series_size("1.3.6.1.4.1.14519.5.2.1.5382.4002.272234209223992578700978260744")
  expect_equal(length(series_size), 4)
  expect_true(series_size$size_bytes > 1000)
  expect_true(series_size$object_count > 10)
  expect_equal(length(series_size$content), 1)
  expect_equal(class(series_size$response), "response")
})

test_that("Invalid series UID", {
  skip_on_cran()
  expect_warning(s <- get_series_size("fake series uid"))
  suppressWarnings(s <- get_series_size("fake series uid"))
  expect_true(is.na(s$size_bytes))
  expect_true(is.na(s$object_count))
})
