context("vocabulary_suggest")

test_that("vocabulary_suggest", {
	skip_on_cran()

  tt <- vocabulary_suggest("cell")

  expect_is(tt, "list")
})
