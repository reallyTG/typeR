library(epos)
context("test_filterNeuroDrugs")

test_that("Test function filterNeuroDrugs()", {
  utils::data(rawDrugBankCoOcEpSO, package="epos")
  atchashda <-
    readAtcMapIntoHashMapDrugNamesAtcCodes(
    system.file("extdata", "db-atc.map", package = "epos"), "\t")
  tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO)
  nepso <- filterNeuroDrugs(tepso, atchashda)
  expect_that(length(nepso), equals(266))
})