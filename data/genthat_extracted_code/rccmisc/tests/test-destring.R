
context("as_numeric")

test_that("misc", {
  expect_that(as_numeric(pi), is_equivalent_to(pi))
  expect_that(as_numeric(3), is_equivalent_to(3))
  expect_that(as_numeric("3"), is_equivalent_to(3))
  expect_that(as_numeric(as.factor(3)), is_equivalent_to(3))
})