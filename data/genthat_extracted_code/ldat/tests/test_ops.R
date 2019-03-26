
context("Ops")

test_ops <- function(fun, x, y, ...) {
  if (missing(y)) {
    result_l <- fun(as_lvec(x), ...)
    result_r <- fun(x, ...)
    expect_that(as_rvec(result_l), equals(result_r))
  } else {
    result_l <- fun(as_lvec(x), as_lvec(y), ...)
    result_r <- fun(x, y, ...)
    expect_that(as_rvec(result_l), equals(result_r))
  }
}


test_that("numeric operators work", {
  set.seed(1)
  x <- rnorm(10)
  x[c(3, 8)] <- NA
  y <- c(1,1,2,2,3,3,4,4,5,6)

  operators <- list(`+`, `-`, `*`, `/`, `%%`, `%/%`)

  for (op in operators) {
    test_ops(op, x, 4)
    test_ops(op, x, y)
    test_ops(op, 4, x)
    expect_error(test_ops(op, 1:3, x))
    test_ops(op, as_lvec(numeric(0)), 4)
  }
})

test_that("logical operators work on numeric vectors", {
  set.seed(1)
  x <- 1:10
  x[c(3, 8)] <- NA
  y <- 11:2

  operators <- list(`==`, `!=`, `<`, `<=`, `>=`, `>`)

  for (op in operators) {
    test_ops(op, x, 4)
    test_ops(op, x, y)
    test_ops(op, 4, x)
    expect_error(test_ops(op, 1:3, x))
    test_ops(op, as_lvec(numeric(0)), 4)
  }
})


test_that("logical operators work", {
  set.seed(1)
  x <- sample(c(TRUE, FALSE), 10, replace=TRUE)
  x[c(3, 8)] <- NA
  y <- sample(c(TRUE, FALSE), 10, replace=TRUE)
  x[c(2, 8)] <- NA

  operators <- list(`&`, `|`, `==`, `!=`, `<`, `<=`, `>=`, `>`)

  for (op in operators) {
    test_ops(op, x, 4)
    test_ops(op, x, y)
    test_ops(op, 4, x)
    expect_error(test_ops(op, 1:3, x))
    test_ops(op, as_lvec(logical(0)), 4)
  }
})


test_that("unary operators work", {
  set.seed(1)
  x <- sample(c(TRUE, FALSE), 10, replace=TRUE)
  x[c(3, 8)] <- NA
  y <- rnorm(10)
  y[c(3, 8)] <- NA

  operators <- list(`+`, `-`, `!`)

  for (op in operators) {
    test_ops(op, x)
    test_ops(op, y)
    test_ops(op, as_lvec(logical(0)))
    test_ops(op, as_lvec(numeric(0)))
  }
})


