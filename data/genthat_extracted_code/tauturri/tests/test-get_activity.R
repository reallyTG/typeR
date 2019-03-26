context("test-get_activity.R")

test_that("get_activity works", {
  res <- get_activity()

  expect_is(res, "list")
  expect_is(res$streams, "list")
  expect_is(res$bandwidth, "list")
  expect_is(res$sessions, "data.frame")
  expect_error(get_activity(url = "google.de"))
})
