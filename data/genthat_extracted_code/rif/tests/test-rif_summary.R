context("rif_summary")

test_that("rif_summary", {
	skip_on_cran()

  tt <- rif_summary("cellular")

  expect_is(tt, "list")
  expect_is(tt$result, "list")
  expect_is(tt$result$literatureSummary, "list")
  expect_is(tt$result$federationSummary, "list")
  expect_is(tt$query, "list")
  expect_is(tt$query$clauses, "data.frame")
  expect_equal(tt$query$operator, "AND")
  expect_is(tt$messages, "list")
})
