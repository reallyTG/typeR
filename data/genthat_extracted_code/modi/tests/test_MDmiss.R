context("Mahalanobis distance with missing values")
library(modi)

test_that("MDmiss without missings outputs the same result as mahalanobis (stats)", {
  A <- matrix(c(2, 4, 3, 13, 5, 8), nrow = 3, ncol = 2, byrow = TRUE)
  expect_equal(MDmiss(A, apply(A, 2, mean), var(A)), mahalanobis(A, apply(A, 2, mean), var(A)))
})
