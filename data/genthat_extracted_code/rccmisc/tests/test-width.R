
context("width")

test_that("misc", {
  expect_that(width(list(1)), equals(1))
  expect_that(width("lkjh"), throws_error())
  expect_that(width(1:10), is_equivalent_to(10))
})
