context("vocabulary_search")

test_that("vocabulary_search", {
	skip_on_cran()

  tt <- vocabulary_search("cell")

  expect_is(tt, "data.frame")
})
