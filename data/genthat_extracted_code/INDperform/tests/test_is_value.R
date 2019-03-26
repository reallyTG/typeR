context("test is_value")

x1 <- c(1:5, NA)
x2 <- c(1:5, NaN)
x3 <- c(1:5, Inf)

test1 <- is_value(x1)
test2 <- is_value(x2)
test3 <- is_value(x3)

test_that("check returned vector", {
  expect_true(is.logical(test1))
  expect_equal(sum(test2), 5)
  expect_true(test3[6] == FALSE)
})
