context("lexical_chunks")

test_that("lexical_chunks", {
	skip_on_cran()

  tt <- lexical_chunks("I am hungry")

  expect_is(tt, "data.frame")
  expect_is(tt$token, "character")
  expect_equal(tt$token[1], "I")
  expect_equal(tt$token[2], "am")
  expect_is(tt$start, "integer")
  expect_equal(tt$start, c(0, 2))
  expect_is(tt$end, "integer")
  expect_equal(tt$end, c(1, 4))
})
