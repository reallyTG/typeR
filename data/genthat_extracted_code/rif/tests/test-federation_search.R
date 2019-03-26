context("federation_search")

test_that("federation_search", {
	skip_on_cran()

  tt <- federation_search("cellular")

  expect_is(tt, "list")
  expect_is(tt$result$results, "data.frame")
  expect_is(tt$result$total, "integer")
  expect_is(tt$result$categories, "data.frame")
  expect_is(tt$query, "list")
  expect_is(tt$query$clauses, "data.frame")
  expect_is(tt$query$operator, "character")
  expect_is(tt$messages, "list")
})
