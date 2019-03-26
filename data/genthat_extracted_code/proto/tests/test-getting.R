context("Getting")

test_that("$ returns values as is", {
  x <- proto(x = 1)

  expect_equal(x$x, 1)
})

test_that("$ inherits from parent", {
  x <- proto(x = 1)
  y <- proto(x, y = 2)

  expect_equal(y$x, 1)
})

test_that("$ doesn't inherit if name starts with ..", {
  x <- proto(..x = 1)
  y <- proto(x, ..y = 2)

  expect_error(y$..x, "not found")
})

test_that("methods are given class protoMethod", {
  x <- proto(f = function(.) 1 + 2)

  expect_is(x$f, "protoMethod")
})

test_that("first argument passed to method is object itself", {
  x <- proto(x = 1, y = 2)

  expect_equal(x$ls(), c("x", "y"))
})
