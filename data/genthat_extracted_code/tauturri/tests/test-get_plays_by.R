context("test-get_plays_by.R")

test_that("get_plays_by_date", {
  res <- get_plays_by_date()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("date", "TV", "Movies", "Music"))
  expect_error(get_plays_by_date(url = "", apikey = ""))
})

test_that("get_plays_by_hourofday works", {
  res <- get_plays_by_hourofday()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("hour", "TV", "Movies", "Music"))
  expect_error(get_plays_by_hourofday(url = "", apikey = ""))
})

test_that("get_plays_by_dayofweek works", {
  res <- get_plays_by_dayofweek()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("day", "TV", "Movies", "Music"))
  expect_equal(levels(res$day), c(
    "Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday", "Saturday", "Sunday"
  ))
  expect_error(get_plays_by_dayofweek(url = "", apikey = ""))
})

test_that("get_plays_per_month works", {
  res <- get_plays_per_month()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("month", "TV", "Movies", "Music"))

  expect_error(get_plays_by_dayofweek(url = "", apikey = ""))
})


test_that("get_plays_by_source_resolution works", {
  res <- get_plays_by_source_resolution()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("resolution", "Direct_Play", "Direct_Stream", "Transcode"))

  expect_error(get_plays_by_source_resolution(url = "", apikey = ""))
})

test_that("get_plays_by_stream_resolution works", {
  res <- get_plays_by_stream_resolution()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("resolution", "Direct_Play", "Direct_Stream", "Transcode"))

  expect_error(get_plays_by_stream_resolution(url = "", apikey = ""))
})

test_that("get_plays_by_stream_type works", {
  res <- get_plays_by_stream_type()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("date", "Direct_Play", "Direct_Stream", "Transcode"))

  expect_error(get_plays_by_stream_type(url = "", apikey = ""))
})
