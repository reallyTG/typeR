context("test-top10.R")

# Top 10 ----
test_that("get_plays_by_top_10_users works", {
  res <- get_plays_by_top_10_users()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("user", "TV", "Movies", "Music"))
  expect_error(get_plays_by_top_10_users(url = "", apikey = ""))
})

test_that("get_plays_by_top_10_platforms works", {
  res <- get_plays_by_top_10_platforms()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("platform", "TV", "Movies", "Music"))
  expect_error(get_plays_by_top_10_platforms(url = "", apikey = ""))
})


test_that("get_stream_type_by_top_10_platforms works", {
  res <- get_stream_type_by_top_10_platforms()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("platform", "Direct_Play", "Direct_Stream", "Transcode"))
  expect_error(get_stream_type_by_top_10_platforms(url = "", apikey = ""))
})

test_that("get_stream_type_by_top_10_users works", {
  res <- get_stream_type_by_top_10_users()
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_named(res, c("user", "Direct_Play", "Direct_Stream", "Transcode"))
  expect_error(get_stream_type_by_top_10_users(url = "", apikey = ""))
})
