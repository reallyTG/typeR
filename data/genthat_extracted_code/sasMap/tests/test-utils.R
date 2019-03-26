context("utils")

s <- system.file('examples/SAScode/MainAnalysis.SAS', package='sasMap')

test_that("Loads a SAS script", {
  
  sasCode <- loadSAS(s)
  
  expect_true(stringr::str_detect(sasCode, "just samples for demoing of sasmap's feature"))
  
})

test_that("Divides a SAS script into statements", {
  
  sasVec <- splitIntoStatements(loadSAS(s))
  
  expect_equal(length(sasVec), 10)
  
})






