context("test-recently-added.R")

test_that("get_recently_added works", {
  count <- 5
  res <- get_recently_added(count = count)
  expect_is(res, "tbl")
  expect_length(res, 40)
  expect_equal(nrow(res), count)

  expect_error(get_recently_added("", ""))
})
