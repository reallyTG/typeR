library(epos)


### Name: createTanimotoBaseline
### Title: Creates the plot for all jaccard coefficients amongst the three
###   epilepsy ontologies
### Aliases: createTanimotoBaseline

### ** Examples

utils::data(rawDrugBankCoOcEpSO, package="epos")
atchashda <-
  readAtcMapIntoHashMapDrugNamesAtcCodes(
    system.file("extdata", "db-atc.map", package = "epos"), "\t")
tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO)
neuroepso <- filterNeuroDrugs(tepso, atchashda)
utils::data(rawDrugBankCoOcESSO, package="epos")
tesso <- genDictListFromRawFreq(rawDrugBankCoOcESSO)
neuroesso <- filterNeuroDrugs(tesso, atchashda)
utils::data(rawDrugBankCoOcEPILONT, package="epos")
tepi <- genDictListFromRawFreq(rawDrugBankCoOcEPILONT)
neuroepi <- filterNeuroDrugs(tepi, atchashda)
dneuro <-
  data.frame(EpSO = neuroepso[1:10],
             ESSO = neuroesso[1:10],
             EPILONT = neuroepi[1:10])
dneuromaxk <- TopKLists::calculate.maxK(dneuro, 3, 5, 10)
tanimotobaseline <- createTanimotoBaseline(neuroepso, neuroesso, neuroepi, dneuromaxk)



