context("Testing add_class")

test_that("Test add_class", {
  add1 <- add_class(list(1), "banana")
  expect_equal(class(add1), c("banana", "list"))
  class(add1) <- "list"
  expect_equal(add1, list(1))

  add2 <- add_class(1, "banana")
  expect_equal(class(add2), c("banana", "numeric"))
  class(add2) <- "numeric"
  expect_equal(add2, 1)

  add3 <- add_class("b", "banana")
  expect_equal(class(add3), c("banana", "character"))
  class(add3) <- "character"
  expect_equal(add3, "b")
})
