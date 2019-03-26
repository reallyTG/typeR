test_that("Multiplipe operator", {
  # base operation
  bcheck <- matrix(c(1, 2, 3, 4), 2, byrow = TRUE) %*%
    matrix(c(0, 1, 1, 0), 2, byrow = TRUE)

  "1, 2
   3, 4" %*>%
    " 0, 1
      1, 0" -> base

  expect_equal(base, bcheck)


  # second argument a matrix
  mcheck <- matrix(c(1, 2, pi, 3, 4, 1, 3, 2, 1), 3, byrow = TRUE) %*%
    diag(c(1, 2, 3))

  "1, 2, pi \\ 3, 4, 1 \\ 3, 2, 1" %*>% diag(c(1, 2, 3)) -> matr

  expect_equal(matr, mcheck)


  # first argument a matrix
  mcheck2 <- diag(c(1, 2, 3)) %*%
    matrix(c(1, 2, pi, 3, 4, 1, 3, 2, 1), 3, byrow = TRUE)

  diag(c(1, 2, 3)) %*>% "1, 2, pi \\ 3, 4, 1 \\ 3, 2, 1" -> matr2

  expect_equal(matr2, mcheck2)

  # both arguments a matrix
  mcheck3 <- diag(c(1,2,3)) %*% diag(c(4,5,6))

  expect_warning(diag(c(1,2,3)) %*>% diag(c(4,5,6)) -> matr3)

  expect_equal(matr3, mcheck3)
})
