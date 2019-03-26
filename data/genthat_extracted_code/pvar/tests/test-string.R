context("String")


test_that("%.% results", {
  expect_that("a"%.%"b", equals("ab"))
  expect_that("a:"%.%1, equals("a:1"))
  expect_that("a:"%.%1:2, equals(c("a:1", "a:2")))
  expect_that(letters[1:2]%.%1:2, equals(c("a1", "b2")))
})

