library(testthat)
library(latticeDensity)

context("Proper functioning of createDensity")

sqr_poly <- cbind(c(0,1,1,0),c(0,0,1,1))
nodeFillingOutput <- nodeFilling(sqr_poly,0.2)
formLatticeOutput <- formLattice(nodeFillingOutput)
point_pattern1 <- matrix(nrow=1,c(1,1))
density_output1 <- createDensity(formLatticeOutput, 
                  PointPattern=point_pattern1, k=1)
density_output2 <- createDensity(formLatticeOutput, 
  PointPattern=point_pattern1, k=300)
den1 = c(0,  0,  0,  0, 0,  0,  0,  0,  
0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  1.5625,  1.5625,
0,  0,  0,  1.5625, 20.3125)
#  NOTE:  For thest tests, area of polygon is 1.0.
test_that("correct density with simple input",{
  expect_equal(mean(density_output1$densityOut), 1)
  expect_equal(mean(density_output2$densityOut), 1)
  expect_lt(max(abs(density_output2$densityOut-1)), 1e-5)
  expect_equal(density_output1$densityOut, den1)
  })

  
