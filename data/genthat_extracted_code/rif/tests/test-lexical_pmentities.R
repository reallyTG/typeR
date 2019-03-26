context("lexical_pmentities")

test_that("lexical_pmentities", {
	skip_on_cran()

  tt <- lexical_pmentities(pmid = 1)

  expect_is(tt, "data.frame")
  expect_is(tt$token, "character")
  expect_equal(length(tt$token), 4)
  expect_is(tt$start, "integer")
  expect_is(tt$end, "integer")
  expect_equal(tt$end, c(13, 41, 64, 70))
})
