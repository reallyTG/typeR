context("Matrix rank")


test_that("matrix_rank computes the correct rank of a matrix", {
  
  x1 <- 1:5
  x2 <- 6:10
  expect_identical(matrix_rank(x1), 1L)
  expect_identical(matrix_rank(cbind(x1, x2)), 2L)
  expect_identical(matrix_rank(cbind(x1, 2*x1)), 1L)
  expect_identical(matrix_rank(as.data.frame(cbind(x1, x2))), 2L)

})
