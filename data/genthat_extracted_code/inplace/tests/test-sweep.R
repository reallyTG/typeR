################################################################################

context("test-sweep.R")

################################################################################

address <- data.table::address

r <- function(n, type) {
  x <- rnorm(n, mean = 100, sd = 10)
  `if`(type == "integer", round(x), x)
}

################################################################################

test_that("in-place operators work in common cases", {

  test_fun <- function(X, margin, val) {

    addr0 <- address(X)

    X2 <- sweep(X, margin, val, op)
    expect_false(identical(X, X2))

    assign <- sprintf("sweep%s_in_place(X, val, op)", margin)
    eval(parse(text = assign))
    expect_identical(X, X2)
    expect_identical(address(X), addr0)
  }

  multiply_sweep1 <- function(x, i, j, val) {
    stop("Don't call the right function.")
  }

  for (type in c("double", "integer")) {

    OPS <- c('*', '/', '-', '+')
    if (type == "integer") OPS <- setdiff(OPS, '/')

    for (op in OPS) {

      X <- rnorm(256, mean = 0, sd = 10)
      dim(X) <- c(8, 32)
      
      one_val  <- r(1, type)
      n_val <- r(nrow(X), type)
      m_val <- r(ncol(X), type)
      
      test_fun(X, 1, one_val)
      test_fun(X, 2, one_val)
      test_fun(X, 1, n_val)
      test_fun(X, 2, m_val)

    }

  }

})

################################################################################

test_that("in-place operators error in special cases", {

  X <- matrix(1:6, 2)
  X2 <- X + 0
  
  # Can't use non-integer values with integers
  expect_error(sweep1_in_place(X, 2.2))
  expect_error(sweep2_in_place(X, 2.2))
  expect_null(sweep1_in_place(X2, 2.2))
  expect_null(sweep2_in_place(X, 2))
  
  # Integers can't be divided
  expect_error(sweep2_in_place(X, 2, '/'))
  expect_null(sweep2_in_place(X, 2, '*'))
  # Doubles can be divided
  expect_null(sweep2_in_place(X2, 2, '/'))
  expect_null(sweep2_in_place(X2, 2.2, '*'))
  # Not a matrix
  X3 <- X2; dim(X3) <- NULL
  expect_error(sweep1_in_place(X3, 2.2, '+'))
  expect_error(sweep2_in_place(X3, 2, '/'))

  # Works only with integers and doubles
  X4 <- as.complex(X); dim(X4) <- dim(X)
  expect_error(sweep1_in_place(X3, 3))
  expect_error(sweep1_in_place(X3, 3:5))

  ## Need corresponding sizes
  expect_error(sweep1_in_place(X2, 1:3))
  expect_null(sweep1_in_place(X2, 1:2))
  expect_null(sweep2_in_place(X2, 1:3))
  expect_error(sweep2_in_place(X2, 1:2))
  expect_error(sweep2_in_place(X2, 1:4))
  expect_error(sweep1_in_place(X2, 1:4))

})

################################################################################
