library(epos)


### Name: createNeuroTable
### Title: Main function to call everything and produce the results
### Aliases: createNeuroTable

### ** Examples

utils::data(rawDrugBankCoOcEpSO, package="epos")
utils::data(rawDrugBankCoOcESSO, package="epos")
utils::data(rawDrugBankCoOcEPILONT, package="epos")
createNeuroTable(coocepso = rawDrugBankCoOcEpSO, 
  coocesso=rawDrugBankCoOcESSO,
  coocepi=rawDrugBankCoOcEPILONT, 10)



