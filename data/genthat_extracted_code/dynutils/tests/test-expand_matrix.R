context("Testing expand_matrix")

test_that("Test expand_matrix", {
  mat <- matrix(runif(12), nrow = 3, dimnames = list(letters[1:3], LETTERS[1:4]))
  mat2 <- expand_matrix(mat, rownames = letters[1:6], colnames = LETTERS[1:5], fill = 1)
  expect_equal(colnames(mat2), LETTERS[1:5])
  expect_equal(rownames(mat2), letters[1:6])
  expect_true(all(mat2[letters[4:6], ] == 1))
  expect_true(all(mat2[, LETTERS[5]] == 1))

  mat <- matrix(runif(12), nrow = 3, dimnames = list(letters[1:3], LETTERS[1:4]))
  mat2 <- expand_matrix(mat, rownames = letters[1:6], fill = 1)
  expect_equal(colnames(mat2), LETTERS[1:4])
  expect_equal(rownames(mat2), letters[1:6])
  expect_true(all(mat2[letters[4:6], ] == 1))

  mat <- matrix(runif(12), nrow = 3, dimnames = list(letters[1:3], LETTERS[1:4]))
  mat2 <- expand_matrix(mat, colnames = LETTERS[1:5], fill = 1)
  expect_equal(colnames(mat2), LETTERS[1:5])
  expect_equal(rownames(mat2), letters[1:3])
  expect_true(all(mat2[, LETTERS[5]] == 1))
})

