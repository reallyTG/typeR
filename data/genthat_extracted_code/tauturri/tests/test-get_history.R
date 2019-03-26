context("test-get_history.R")

test_that("get_history works", {
  res <- get_history(length = 10)
  expect_is(res, "list")
  expect_is(res$totals, "data.frame")
  expect_is(res$history, "data.frame")
  expect_equal(nrow(res$history), 10)
  # expect_length(res$history, 30)
})
