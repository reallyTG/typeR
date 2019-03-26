context("test-get_home_stats.R")

test_that("get_home_stats works", {
  res <- get_home_stats()
  expect_is(res, "list")
  expect_length(res, 10)
  expect_true(all(sapply(res, tibble::is.tibble)))
  expect_named(res, c(
    "Most_Watched_Movies", "Most_Popular_Movies", "Most_Watched_TV_Shows",
    "Most_Popular_TV_Shows", "Most_Played_Artists", "Most_Popular_Artists",
    "Recently_Watched", "Most_Active_Users", "Most_Active_Platforms",
    "Most_Concurrent_Streams"
  ))
  expect_error(get_home_stats("", ""))
})
