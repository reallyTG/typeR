context("Utility functions")

test_that("utility functions work correctly", {

  expect_identical(add_dots(1:10, pos = 3), c("1", "2", "...", "10"))
  expect_identical(add_dots(1:10, pos = 10), 1:10)

  m1 <- matrix(1:4, nrow = 2)
  m2 <- matrix(c(1.0, 2.0, 3.0, 4.0), nrow = 2)
  m3 <- matrix(c(letters[1:4]), nrow = 2)
  expect_identical(desc_mat(m1), "2 x 2 matrix of integers:")
  expect_identical(desc_mat(m2), "2 x 2 matrix of doubles:")
  expect_identical(desc_mat(m3), "2 x 2 matrix of characters:")

})
