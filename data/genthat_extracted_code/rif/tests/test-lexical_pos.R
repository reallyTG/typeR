context("lexical_pos")

test_that("lexical_pos", {
	skip_on_cran()

  tt <- lexical_pos("I am hungry")

  expect_is(tt, "data.frame")
  expect_is(tt$token, "character")
  expect_equal(length(tt$token), 3)
  expect_is(tt$start, "integer")
  expect_equal(tt$start, c(0, 2, 5))
  expect_is(tt$end, "integer")
  expect_equal(tt$end, c(1, 4, 11))
})
