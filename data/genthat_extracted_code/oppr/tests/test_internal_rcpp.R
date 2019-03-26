context("internal rcpp")

test_that("rcpp_branch_order (regular matrix)", {
  m <- structure(c(1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1,
                   0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0,
                   0, 0, 1), .Dim = c(5L, 8L), .Dimnames = list(NULL, NULL))
  m <- as(m, "dgCMatrix")
  o <- rcpp_branch_order(m)
  expect_equal(o, c(2, 4, 5, 7, 8, 1, 3, 6))
})

test_that("rcpp_branch_order (identity matrix)", {
  m <- diag(5)
  m <- as(m, "dgCMatrix")
  o <- rcpp_branch_order(m)
  expect_equal(o, seq_len(5))
})

test_that("rcpp_branch_order (duplicated features)", {
  m <- diag(1, nrow = 5, ncol = 7)
  m[1, 7] <- 1
  m[2, 6] <- 1
  m2 <- m[, c(4, 1, 2, 5, 3, 6, 7)]
  o <- rcpp_branch_order(as(m2, "dgCMatrix"))
  expect_equal(m2[, o], m)
})
