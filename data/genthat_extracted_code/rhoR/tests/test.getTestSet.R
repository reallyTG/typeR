library(testthat)
context("Test default inflation rate at 0")

test_that("default inflation to 0", {
  testSetLength = 20
  testSetInflation = 0.2
  
  testSet = getTestSet(
    set = as.data.frame(codeSet), 
    testSetLength = 10
  )
  testSetBR = baserate(testSet)
  
  expect_named(testSet, c("firstRater", "secondRater"))
})