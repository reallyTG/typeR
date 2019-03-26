library(epos)
context("test_createBaseTable")

test_that("Test function createBaseTable()", {
  utils::data(rawDrugBankCoOcEpSO, package="epos")
  utils::data(rawDrugBankCoOcESSO, package="epos")
  utils::data(rawDrugBankCoOcEPILONT, package="epos")
  atchashda <-
  readAtcMapIntoHashMapDrugNamesAtcCodes(
    system.file("extdata", "db-atc.map", package = "epos"), "\t")
  atchashaa <-
    readAtcMapIntoHashMapAtcCodesAtcNames(
      system.file("extdata", "db-atc.map", package = "epos"), "\t")
  atchashsec <-
    readSecondLevelATC(
      system.file("extdata", "drugbankatc-secondlevel.map", package = "epos"), "\t")
  tepso <- rawDrugBankCoOcEpSO[1:500]
  tesso <- rawDrugBankCoOcESSO[1:500]
  tepi <- rawDrugBankCoOcEPILONT[1:500]
  lepso <- genDictListFromRawFreq(tepso)
  neuroepso <- filterNeuroDrugs(lepso, atchashda)
  lesso <- genDictListFromRawFreq(tesso)
  neuroesso <- filterNeuroDrugs(lesso, atchashda)
  lepi <- genDictListFromRawFreq(tepi)
  neuroepi <- filterNeuroDrugs(lepi, atchashda)
  dneuro <-
    data.frame(EpSO = neuroepso[1:10],
               ESSO = neuroesso[1:10],
               EPILONT = neuroepi[1:10])
  dneuromaxk <- TopKLists::calculate.maxK(dneuro, 3, 5, 10)
  neurospace <- as.character(dneuromaxk$topkspace)
  neurotable <-
    createBaseTable(neurospace, atchashda, atchashsec, dneuromaxk)
  expect_that(length(neurotable), equals(12))
})