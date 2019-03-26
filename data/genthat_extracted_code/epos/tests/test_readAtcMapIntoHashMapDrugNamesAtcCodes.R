library(epos)
context("test_readAtcMapIntoHashMapDrugNamesAtcCodes")

test_that("Test function readAtcMapIntoHashMapDrugNamesAtcCodes()", {
  atchashda <- readAtcMapIntoHashMapDrugNamesAtcCodes(
    system.file("extdata", "db-atc.map", package = "epos"), "\t")
  expect_that(length(atchashda$keys()), equals(2286))
})