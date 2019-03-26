library(testthat)
library(latticeDensity)

context("Proper functioning of varianceMap")

rect_poly <- cbind(c(0,1,1,0),c(0,0,0.2,0.2))
nodeFillingOutput <- nodeFilling(rect_poly,0.2)
formLatticeOutput <- formLattice(nodeFillingOutput)
point_pattern <- rbind(c(0.05,0.1),c(0.85,0.1),c(0.95,0.1))
Z = c(10,100,100)
var_map <- varianceMap(formLatticeOutput,Z=Z,
          PointPattern=point_pattern,M=0.5,k=1)
correct_se1 <- sqrt(2700*(3/4)^2/((3/4)^2))
correct_se2 <- sqrt(2700*((1/4)^2+(1/4)^2)/(1/2)^2)
#
test_that("correct variance map with simple input",{
  expect_lt(max(abs(var_map$SE_map[1:2]-correct_se1)), 0.1)
  expect_lt(max(abs(var_map$SE_map[4:5]-correct_se2)), 0.1)
  expect_true(is.na(var_map$SE[3]))
})