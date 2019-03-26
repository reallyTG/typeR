library(testthat)
context("Test getHandset")

test_that("default getHandSet tests", {
  testSetLength = 10
  testSetInflation = 0.2
  
  testSet = getTestSet(
    set = as.data.frame(codeSet), 
    testSetLength = testSetLength
  )
  
  getHandSet(codeSet, 10, 0.1)
  indices = getHandSetIndices(codeSet, 10, 0.1)
  
  expect_named(testSet, c("firstRater", "secondRater"))
})