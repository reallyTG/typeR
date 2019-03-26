require("testthat")

# input matrix as strings
test_that("Tests of pairwise comparison matrix", {
  comparisonMatrixValues = c("1","9","5",
                       "1/9","1","1/3",
                       "1/5","3","1")
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
  matrix = pairwiseComparisonMatrix(comparisonMatrix)
  expect_is(matrix, "PairwiseComparisonMatrix")
})

# input matrix as values with lower triangle empty
test_that("Tests of pairwise comparison matrix", {
  comparisonMatrixValues = c(1,9,5,
                             NA,1,1/3,
                             NA,NA,1)
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
  matrix = pairwiseComparisonMatrix(comparisonMatrix)
  expect_is(matrix, "PairwiseComparisonMatrix")
})

# input matrix as values with upper triangle as zeroes
test_that("Tests of pairwise comparison matrix", {
  comparisonMatrixValues = c(1,0,0,
                             1/9,1,0,
                             1/5,3,1)
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
  matrix = pairwiseComparisonMatrix(comparisonMatrix)
  expect_is(matrix, "PairwiseComparisonMatrix")
})

test_that("Tests of pairwise comparison matrix - failed (matrix does not have ones on diagonal)", {
  comparisonMatrixValues = c("1","9","5",
                             "1/9","2","1/3",
                             "1/5","3","1")
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
  expect_error(pairwiseComparisonMatrix(comparisonMatrix),
               "The elements on the main diagonal of the pairwise comparison matrix must be equal to 1. Position 2,2 is not equal to 1.")
})

test_that("Tests of pairwise comparison matrix - failed (matrix is not reciprocal)", {
  comparisonMatrixValues = c("1","9","5",
                             "1/9","1","1/3",
                             "1/6","3","1")
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 3, ncol = 3, byrow = TRUE)
  expect_error(pairwiseComparisonMatrix(comparisonMatrix),
               "The pairwise comparison matrix is not reciprocal.")
})

test_that("Tests of pairwise comparison matrix - failed (matrix is not squared)", {
  comparisonMatrixValues = c("1","9","5",
                             "1/9","1","1/3",
                             "1/5","3","1",
                             "1/8","8","1")
  comparisonMatrix = matrix(comparisonMatrixValues, nrow = 4, ncol = 3, byrow = TRUE)
  expect_error(pairwiseComparisonMatrix(comparisonMatrix),
               "The pairwise comparison matrix is not a square matrix. Dimensions are - ncol = 3, nrow = 4.")
})
