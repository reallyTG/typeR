context("count")

s1 <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
s2 <- system.file('examples/SAScode/Macros/Util1.SAS', package='sasMap')

sasCode1 <- loadSAS(s1)
sasCode2 <- loadSAS(s2)

test_that("Counts data steps", {
  
  expect_equal(countDataSteps(sasCode1), 2)
  expect_equal(countDataSteps(sasCode2), 0)

})

test_that("Counts proc steps", {
  
  expect_equal(countProcSteps(sasCode1), 0)
  expect_equal(countProcSteps(sasCode2), 2)
  
})

test_that("Counts lines", {
  
  expect_equal(countLines(sasCode1), 15)
  expect_equal(countLines(sasCode2), 20)
  
})

test_that("Counts statements", {
  
  expect_equal(countStatements(sasCode1), 10)
  expect_equal(countStatements(sasCode2), 14)
  
})