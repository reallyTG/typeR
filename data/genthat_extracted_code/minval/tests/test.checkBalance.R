# Output Class
chemicalData <- read.csv2(system.file("extdata", "chemData.csv", package = "minval"))
reactionList <- c(
  "3-Phospho-D-glycerate[c] <=> 2-Phospho-D-glycerate[m]",
  "alpha-D-Glucose[c] => 180 H+[c]",
  "alpha-D-Glucose[c] <=> 2 Pyruvate[c]",
  "ATP[c] + H2O[c] <=> ADP[c] + Orthophosphate[c]",
  "Glycerone phosphate[c] => D-Glyceraldehyde 3-phosphate[c]",
  "alpha-D-Glucose[c] <=>"
)
test_that("checkBalance function: Output class is wrong", {
  expect_true(is.vector(checkBalance(reactionList = reactionList,referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA")))
})

# Output Value
test_that("checkBalance function: Output value is wrong", {
  expect_true(checkBalance(reactionList = reactionList[1],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
  expect_false(checkBalance(reactionList = reactionList[2],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
  expect_false(checkBalance(reactionList = reactionList[3],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
  expect_true(checkBalance(reactionList = reactionList[4],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
  expect_true(checkBalance(reactionList = reactionList[5],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
  expect_true(checkBalance(reactionList = reactionList[6],referenceData = chemicalData,ids = "NAME",mFormula = "FORMULA"))
})
