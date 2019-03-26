library(testthat)
library(latticeDensity)

context("Proper functioning of createNparReg")

rect_poly <- cbind(c(0,1,1,0),c(0,0,0.2,0.2))
nodeFillingOutput <- nodeFilling(rect_poly,0.2)
formLatticeOutput <- formLattice(nodeFillingOutput)
point_pattern <- rbind(c(0.05,0.1),c(0.85,0.1),c(0.95,0.1))
Z = c(10,100,100)
NparRegOut <- createNparReg(formLatticeOutput,Z=Z,
                 PointPattern=point_pattern,k=1)
numerator <- NparRegOut$NparRegNum
denominator <- NparRegOut$NparRegDenom
map <- NparRegOut$NparRegMap
correct_num = c(2.5, 0.833333, 0, 16.6666, 50)
correct_denom = c(0.25, 0.0833333, 0, 0.166666, 0.50000)
correct_map = c(10, 10, 70, 100, 100)
correct_sigma2 = 2700
#  NOTE:  For thest tests, area of polygon is 0.2.
#  NOTE:  Mean has been filled in for missing value in middle.
test_that("correct map with simple input",{
  expect_equal(sum(numerator), 70)
  expect_equal(sum(denominator), 1)
  expect_lt(max(abs(correct_map-map)), 1e-4)
  expect_lt(max(abs(correct_denom-denominator)), 1e-4)
  expect_lt(max(abs(correct_num-numerator)), 1e-4)
  expect_lt(max(abs(NparRegOut$sigma2-correct_sigma2)), 1)
})