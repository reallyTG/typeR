context("vocabulary_providers")

test_that("vocabulary_providers", {
	skip_on_cran()

  tt <- vocabulary_providers()

  expect_is(tt, "list")
})
