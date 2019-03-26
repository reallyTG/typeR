context("Check Xvar")

test_that("Checking check.xvar",{
  
  #Check that for positive values of meancft and meanrr gives TRUE
  expect_error({
    check.xvar(NA)
  })
  
  #Check that negative matrices don't work
  expect_error({
    check.xvar(matrix(-c(1,0,0,2), byrow = T, ncol = 2))
  })
  
  #Check that non-positive matrices don't work
  expect_error({
    check.xvar(matrix(c(-1,0,0,2), byrow = T, ncol = 2))
  })
  
  #Check that matrix is returned as inputed
  expect_equal(
    {
    mat <- matrix(c(1,0,0,2), byrow = T, ncol = 2)
    check.xvar(mat)},
    mat
  )
  
  #Check that non-square matrices don't work
  expect_error({
    check.xvar(matrix(c(1,2,3,4,5,6), byrow = T, ncol = 3))
  })
  
})