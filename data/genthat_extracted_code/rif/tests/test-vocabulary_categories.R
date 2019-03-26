context("vocabulary_categories")

test_that("vocabulary_categories", {
	skip_on_cran()

  tt <- vocabulary_categories()

  expect_is(tt, "list")
})
