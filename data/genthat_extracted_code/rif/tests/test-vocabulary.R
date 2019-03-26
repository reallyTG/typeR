context("vocabulary")

test_that("vocabulary", {
  skip_on_cran()

  tt <- vocabulary(prefix = "cell")

  expect_is(tt, "data.frame")
  expect_is(tt$term, "character")
  expect_is(tt$id, "character")
  expect_is(tt$category, "character")
  expect_is(tt$provider, "character")
  expect_is(tt$inferred, "logical")
  expect_is(tt$acronym, "logical")
  expect_is(tt$abbreviation, "logical")
  expect_is(tt$synonyms, "logical")
  expect_is(tt$definition, "logical")
})
