context("calc_cofactor for MTA method works correctly")

test_that("calc_cofactor", {
    
  calculated_cofactor <- calc_cofactor(
       matrix(c(2, sqrt(3), 1, sqrt(3), 2, sqrt(3), 1, sqrt(3), 2) / 2, nr = 3))
  
  correct_cofactor <- 
    matrix(c(1, -sqrt(3), 1, -sqrt(3), 3, -sqrt(3), 1, -sqrt(3), 1) / 4, nr = 3)
  
  expect_equal(round(calculated_cofactor, 5), correct_cofactor, tol = 1e-5)  
  
})
