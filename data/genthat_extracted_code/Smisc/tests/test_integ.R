context("integ()")

test_that("Simpson's rule is working", {

  # Beta
  a <- integ(dbeta(seq(0, 0.7, length = 1001), 2, 5), a = 0, b = 0.7)
  b <- pbeta(0.7, 2, 5)
  expect_equal(a, b)

  # Quadratic
  expect_true(integ(seq(0, 3, length = 21)^2, a = 0, b = 3) == 9)

  # Linear
  x <- seq(0, 2, length = 3)
  y <- 2 * x + 3
  expect_true(integ(y, a = 0, b = 2) == 10)
  
})

test_that("Trapezoid rule is working", {

  # Beta
  x <- seq(0, 0.7, length = 1001)
  a <- integ(dbeta(x, 2, 5), x = x, method = "t")
  b <- pbeta(0.7, 2, 5)
  expect_true(abs(a - b) < 1e-05)

  # Quadratic
  x <- seq(0, 3, length = 10001)
  expect_equal(integ(x^2, x = x, method = "t"), 9)

  # Linear
  x <- seq(0, 2, length = 3)
  y <- 2 * x + 3
  expect_true(integ(y, x = x, method = "t") == 10)
  
})
