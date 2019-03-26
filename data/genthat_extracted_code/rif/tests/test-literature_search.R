context("literature_search")

test_that("literature_search", {
  skip_on_cran()

  tt <- literature_search(query = "cellular")

  expect_is(tt, "list")
  expect_is(tt$result, "list")
  expect_is(tt$result$publications, "data.frame")
  expect_is(tt$result$facets, "list")
  expect_is(tt$result$debugInfo, "character")
  expect_is(tt$result$offset, "integer")
  expect_is(tt$result$resultCount, "integer")
  expect_is(tt$query, "list")
  expect_is(tt$query$clauses, "data.frame")
  expect_match(tt$query$operator, "AND")
  expect_is(tt$messages, "list")
})
