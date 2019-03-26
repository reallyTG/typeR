context("Regression tests for pacotest")

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeCCC, finalComparison = pairwiseMax, sizeKeepingMethod = splitTrainEvaluate")
test_that("CCC1", {
  testthat::skip_on_cran()
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeCCC', 'pairwiseMax', 'splitTrainEvaluate', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})
  
context("unit tests for pacotest with options:
testType=CCC, grouping = TreeCCC, finalComparison = all, sizeKeepingMethod = splitTrainEvaluate")
test_that("CCC2", {
  testthat::skip_on_cran()
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeCCC', 'all', 'splitTrainEvaluate', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})
  

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeEC, finalComparison = pairwiseMax, sizeKeepingMethod = splitTrainEvaluate")
test_that("CCC3", {
  testthat::skip_on_cran()
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeEC', 'pairwiseMax', 'splitTrainEvaluate', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeEC, finalComparison = all, sizeKeepingMethod = splitTrainEvaluate")
test_that("CCC4", {
  testthat::skip_on_cran()
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeEC', 'all', 'splitTrainEvaluate', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeCCC, finalComparison = pairwiseMax, sizeKeepingMethod = penalty")
test_that("CCC5", {
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeCCC', 'pairwiseMax', 'penalty', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeCCC, finalComparison = all, sizeKeepingMethod = penalty")
test_that("CCC6", {
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeCCC', 'all', 'penalty', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})


context("unit tests for pacotest with options:
testType=CCC, grouping = TreeEC, finalComparison = pairwiseMax, sizeKeepingMethod = penalty")
test_that("CCC7", {
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeEC', 'pairwiseMax', 'penalty', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = TreeEC, finalComparison = all, sizeKeepingMethod = penalty")
test_that("CCC8", {
  
  properties = c('testType', 'grouping', 'finalComparison', 'sizeKeepingMethod', 'withEstUncert')
  values = c('CCC', 'TreeEC', 'all', 'penalty', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = SumMedian")
test_that("CCC9", {
  
  properties = c('testType', 'grouping', 'withEstUncert')
  values = c('CCC', 'SumMedian', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = ProdThirdsII")
test_that("CCC10", {
  
  properties = c('testType', 'grouping', 'withEstUncert')
  values = c('CCC', 'ProdThirdsII', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

context("unit tests for pacotest with options:
testType=CCC, grouping = SumThirdsIII")
test_that("CCC11", {
  
  properties = c('testType', 'grouping', 'withEstUncert')
  values = c('CCC', 'SumThirdsIII', 'FALSE')
  
  thisTestsInd = filterPacotestOptionLists(pacotestOptions, properties, values)
  
  unitTestKernel(data, pacotestOptions, hardCodedResults, seedsPerTest, thisTestsInd)
  
})

