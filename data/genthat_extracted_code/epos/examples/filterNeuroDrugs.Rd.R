library(epos)


### Name: filterNeuroDrugs
### Title: Filter a given list of drug names for having an ATC code
###   starting with N indicating to be a drug for the Nervous System
### Aliases: filterNeuroDrugs

### ** Examples

utils::data(rawDrugBankCoOcEpSO, package="epos")
atchashda <-
  readAtcMapIntoHashMapDrugNamesAtcCodes(
  system.file("extdata", "db-atc.map", package = "epos"), "\t")
tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO)
nepso <- filterNeuroDrugs(tepso, atchashda)



