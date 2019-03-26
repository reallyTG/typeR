
context("safe_ifelse")

test_that("misc", {
  expect_that(safe_ifelse(NA, 1, 2), is_equivalent_to(2))
  expect_that(safe_ifelse(TRUE, as.factor("hello"), 2), throws_error())
  expect_that(safe_ifelse(TRUE, as.factor("hello"), as.factor(2)), is_identical_to(as.factor("hello")))
  expect_that(safe_ifelse(TRUE, 1, NA), is_equivalent_to(1))
  expect_that(safe_ifelse(FALSE, 1, NA), is_equivalent_to(NA))
})


