context("test Cholesky update")

test_that("chol_update works", {

  expect_error(chol_update(1, 1))
  expect_error(chol_update(diag(2), 1))
  expect_error(chol_update(diag(2), "a"))
  expect_error(chol_update(list(2), "a"))

  L <- matrix(c(1.1, 2, 0, 4), 2, 2)
  u <- c(2, 1)
  expect_equal(chol_update(L, u), t(chol(L %*% t(L) + u %*% t(u))), tol = 1e-15)

  #no reference to upper triangular part
  L2 <- matrix(c(1.1, 2, 100, 4), 2, 2)
  expect_identical(chol_update(L, u)[c(1, 2, 4)], chol_update(L2, u)[c(1, 2, 4)])

})

context("test Cholesky downdate")

test_that("chol_downdate works", {

  expect_error(chol_downdate(1, 1))
  expect_error(chol_downdate(diag(2), 1))
  expect_error(chol_downdate(diag(2), "a"))
  expect_error(chol_downdate(list(2), "a"))

  L <- matrix(c(1.1, 2, 0, 4), 2, 2)
  u <- c(2, 1)
  #not positive definite
  expect_error(chol_downdate(L, u))

  u2 <- c(0.1, 0.2)
  expect_equal(chol_downdate(L, u2), t(chol(L %*% t(L) - u2 %*% t(u2))), tol = 1e-15)

  L2 <- matrix(c(1.1, 2, 100, 4), 2, 2)
  expect_identical(chol_downdate(L, u2)[c(1, 2, 4)], chol_downdate(L2, u2)[c(1, 2, 4)])

})

context("test RAM update")

test_that("adapt_S works", {

  expect_error(adapt_S(1, 1))
  expect_error(adapt_S(1, 1, 0.3))
  expect_error(adapt_S(diag(2), 1, 0.3, 2))
  expect_error(adapt_S(diag(2), "a", 0.3, 2))
  expect_error(adapt_S(list(2,2), 1, 0.3, 2))
  expect_error(adapt_S(1, 1, "a", 2))
  expect_error(adapt_S(1, 1, 0.3, "a"))
  expect_error(adapt_S(1, 1, 3, -1))
  expect_error(adapt_S(1, 1, 3, 1))
  expect_error(adapt_S(1, 1, 0.3, 1, c(0.1,0.3)))
  expect_error(adapt_S(1, 1, 0, 1, 1))
  expect_error(adapt_S(1, 1, 0, 1, gamma = 2))
  expect_error(adapt_S(matrix(1, 2, 2), c(1, 1), 0, 1))
  expect_error(adapt_S(matrix(1, 2, 1), c(1, 1), 0, 1))

  S <- matrix(c(1.1, 2, 0, 4), 2, 2)
  u <- c(2, 1)
  #target == current
  expect_identical(adapt_S(S, u, 0.234, 1), S)

  #downdate
  S <- diag(2)
  u <- c(1, 1)
  S_new <- t(chol(S - 0.234 * u %*% t(u) / sum(u^2)))
  expect_equal(adapt_S(S, u, 0, 0), S_new, tol = 1e-15)

  #update
  S_new <- t(chol(S + 0.234 * u %*% t(u) / sum(u^2)))
  expect_equal(adapt_S(S, u, 0.334, 0, 0.1), S_new, tol = 1e-15)

  S <- matrix(c(1.1, 2, 0, 4), 2, 2)
  u <- c(2, 3)
  S_new <- S %*% t(chol(diag(2) - 2 * 10^(-2/3) * 0.234 * u %*% t(u)/sum(u^2)))
  expect_equal(adapt_S(S, u, 0, n = 10), S_new, tol = 1e-15)

})
