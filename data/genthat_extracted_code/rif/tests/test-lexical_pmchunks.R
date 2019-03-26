context("lexical_pmchunks")

test_that("lexical_pmchunks", {
	skip_on_cran()

  tt <- lexical_pmchunks(pmid = 1)

  expect_is(tt, "data.frame")
  expect_is(tt$token, "character")
  expect_equal(length(tt$token), 5)
  expect_is(tt$start, "integer")
  expect_equal(tt$start, c(0, 17, 30, 45, 66))
  expect_is(tt$end, "integer")
  expect_equal(tt$end, c(13, 28, 41, 63, 70))
})
