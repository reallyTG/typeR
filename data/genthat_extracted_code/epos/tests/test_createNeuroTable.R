library(epos)
context("test_createNeuroTable")

test_that("Test function createNeuroTable()", {
  utils::data(rawDrugBankCoOcEpSO, package="epos")
  utils::data(rawDrugBankCoOcESSO, package="epos")
  utils::data(rawDrugBankCoOcEPILONT, package="epos")
  nt <- createNeuroTable(coocepso = rawDrugBankCoOcEpSO,
    coocesso=rawDrugBankCoOcESSO,
    coocepi=rawDrugBankCoOcEPILONT, 10)
  expect_that(length(nt), equals(12))
})