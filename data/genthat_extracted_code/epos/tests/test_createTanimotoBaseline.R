library(epos)
context("test_createTanimotoBaseline")

test_that("Test function createTanimotoBaseline()", {
  utils::data(rawDrugBankCoOcEpSO, package="epos")
  atchashda <-
    readAtcMapIntoHashMapDrugNamesAtcCodes(
      system.file("extdata", "db-atc.map", package = "epos"), "\t")
  tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO[1:500])
  neuroepso <- filterNeuroDrugs(tepso, atchashda)
  utils::data(rawDrugBankCoOcESSO, package="epos")
  tesso <- genDictListFromRawFreq(rawDrugBankCoOcESSO[1:500])
  neuroesso <- filterNeuroDrugs(tesso, atchashda)
  utils::data(rawDrugBankCoOcEPILONT, package="epos")
  tepi <- genDictListFromRawFreq(rawDrugBankCoOcEPILONT[1:500])
  neuroepi <- filterNeuroDrugs(tepi, atchashda)
  dneuro <-
    data.frame(EpSO = neuroepso[1:10],
               ESSO = neuroesso[1:10],
               EPILONT = neuroepi[1:10])
  dneuromaxk <- TopKLists::calculate.maxK(dneuro, 3, 5, 10)
  tanimotobaseline <- createTanimotoBaseline(neuroepso, neuroesso, neuroepi, dneuromaxk)
  expect_that(length(tanimotobaseline), equals(9))
})