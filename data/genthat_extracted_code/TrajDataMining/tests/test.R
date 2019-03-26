library(TrajDataMining)
context("Test of main methods")

test_that("Test speed filter", {
  expect_lt(length(speedFilter(A1,0.01)),length(A1))
})

test_that("Test douglasPeucker method", {
  expect_lt(length(douglasPeucker(A1,110792.3)),length(A1))
  
})

test_that ("Test owMeratniaByCollection",{
  expect_lt(length(owMeratniaByCollection(tracksCollection,13804.84 ,0.03182201)),length(A1))
  
})

test_that ("Test OwMeratnialBy",{
  expect_lt(length(owMeratniaBy(A1,110792.3,585.6829)), length(A1))
  
})


test_that("Test DirectionCluster",{
  expect_type(directionCluster(A1,0,0,359),"list")
  
})

test_that("Test partner",{
  expect_type(partner(A1,A2,110792,2277,0,FALSE),"list")
})

