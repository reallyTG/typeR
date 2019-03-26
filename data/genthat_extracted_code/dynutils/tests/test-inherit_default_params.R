context("Testing inherit_default_params")

fun1 <- function(a = 10, b = 7) {
  runif(a, -b, b)
}

fun2 <- function(c = 9) {
  2^c
}

fun3 <- inherit_default_params(
  super = list(fun1, fun2),
  fun = function(a, b, c) {
    x <- fun1(a, b)
    y <- fun2(c)
    list(x = x, y = y)
  }
)

test_that("testing with default parameters", {
  out <- fun3()
  expect_equal(out$y, 512)
  expect_equal(length(out$x), 10)
  expect_lte(max(out$x), 7)
  expect_gte(min(out$x), -7)
})

test_that("testing with custom parameters", {
  out <- fun3(1, 2, 3)
  expect_equal(out$y, 8)
  expect_equal(length(out$x), 1)
  expect_lte(max(out$x), 2)
  expect_gte(min(out$x), -2)
})

test_that("testing with only one inherited function", {
  fun4 <- inherit_default_params(
    super = fun2,
    fun = function(c) c
  )

  out <- fun4()
  expect_equal(out, 9)

  out <- fun4(3)
  expect_equal(out, 3)
})
