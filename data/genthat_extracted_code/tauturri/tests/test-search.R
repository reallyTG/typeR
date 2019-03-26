context("test-search.R")

test_that("search kinda works", {
  res <- search_server(query = "Game of Thrones")
  expect_is(res, "list")
  expect_length(res, 8)
  expect_error(search_server("", "", query = "Wurst"))
  expect_error(search_server(query = NULL))
})
