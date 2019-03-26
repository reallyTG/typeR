library(epos)
context("test_readAtcMapIntoHashMapAtcCodesAtcNames")

test_that("Test function readAtcMapIntoHashMapAtcCodesAtcNames()", {
  atchashaa <-
     readAtcMapIntoHashMapAtcCodesAtcNames(
       system.file("extdata", "db-atc.map", package = "epos"), "\t")
  expect_that(length(atchashaa$keys()), equals(619))
})