context("rif_query_categories")

test_that("rif_query_categories", {
	skip_on_cran()

  tt <- rif_query_categories()

  expect_is(tt, "character")
  expect_gt(length(tt), 10)
  expect_match(tt[1], "[A-Za-z]")
})
