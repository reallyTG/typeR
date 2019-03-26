library(epos)


### Name: filterApprovedDrugs
### Title: Filter a given list of drug names for having an ATC code, if not
###   they are dropped
### Aliases: filterApprovedDrugs

### ** Examples

utils::data(rawDrugBankCoOcEpSO, package="epos")
atchashda <-
  readAtcMapIntoHashMapDrugNamesAtcCodes(
  system.file("extdata", "db-atc.map", package = "epos"), "\t")
tepso <- genDictListFromRawFreq(rawDrugBankCoOcEpSO)
filterApprovedDrugs(tepso, atchashda)



