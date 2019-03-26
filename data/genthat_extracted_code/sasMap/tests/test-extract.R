context("extract")

s1 <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')
s2 <- system.file('examples/SAScode/Macros/Util1.SAS', package='sasMap')

sasCode1 <- loadSAS(s1)
sasCode2 <- loadSAS(s2)

test_that("Extracts macro definitions", {
  
  expect_equal(extractMacroDefs(sasCode2), "util1")
  
})

test_that("Extracts macro calls", {
  
  expect_equal(extractMacroCalls(sasCode1), "modelcode")
  expect_equal(extractMacroCalls(sasCode2), "fun1")
  
})

test_that("Extracts procs", {
  
  expect_equal(extractProcs(sasCode1), character(0))
  expect_equal(extractProcs(sasCode2), c("freq", "print"))
  
})

