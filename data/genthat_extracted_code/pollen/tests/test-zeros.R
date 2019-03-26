context("zeros")

test_that("zero is zero", {
  expect_that(is_zero(0), is_true())
  expect_that(is_zero(0.0000000001), is_false())
  expect_that(is_zero(111), is_false())
  expect_that(is_zero(-111), is_false())
  expect_that(is_zero(TRUE), is_false())
  expect_that(all(is_zero(c(0, 0))), is_true())
  expect_that(is_zero("111"), is_false())
})
