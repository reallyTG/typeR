context("seasons")
expect_df <- function(x) expect_is(x, "data.frame")
expect_numeric <- function(x) expect_is(x, "numeric")
expect_date <- function(x) expect_is(x, "Date")

test_that("results are proper", {
  data(pollen_count)
  df <- subset(pollen_count, site == "Oz")
  results <- pollen_season(value = df$birch, date = df$date, method = "95")
  expect_df(results)
  expect_numeric(results$year)
  expect_date(results$start)
})

test_that("driessen works", {
  data(pollen_count)
  df <- subset(pollen_count, site == "Oz")
  expect_error(pollen_season(value = df$birch, date = df$date, method = "Driessen"))
})
