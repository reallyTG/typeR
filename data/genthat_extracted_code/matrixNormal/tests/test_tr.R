context("tr() function: The trace function works ")
library(testthat)
library(matrixNormal)

test_that( 'Tr of 3 x 3 Identity or Constant matrix is 3',{
  expect_equal( tr( I(3) ), 3)
  expect_equal( tr( J(3)),  3)
})



test_that( 'Cannot take trace of not square matrix', {
   A <- matrix( seq( 1, 6, 1 ), nrow=3, ncol = 2, byrow=TRUE )
   expect_error( tr(A), "A is not a square matrix")
})

#test_that( 'Test that is not numeric', {
#  B <- matrix( letters[1:6], nrow = 3)
#  expect_error( tr(B), "A must be a numeric matrix.")
#})
