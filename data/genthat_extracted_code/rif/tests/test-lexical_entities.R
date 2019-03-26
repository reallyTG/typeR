context("lexical_entities")

test_that("lexical_entities", {
	skip_on_cran()

  tt <- lexical_entities("I am hungry")

  expect_is(tt, "data.frame")
  expect_is(tt$token, "character")
  expect_equal(tt$token, "hungry")
  expect_is(tt$start, "integer")
  expect_equal(tt$start, 5)
  expect_is(tt$end, "integer")
  expect_equal(tt$end, 11)
})
