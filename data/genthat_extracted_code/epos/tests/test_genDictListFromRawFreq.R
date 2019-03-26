library(epos)
context("test_genDictListFromRawFreq")

test_that("Test function genDictListFromRawFreq()", {
  utils::data(rawDrugBankCoOcEpSO, package="epos")
  tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO)
  expect_that(length(tepso), equals(2643))
})