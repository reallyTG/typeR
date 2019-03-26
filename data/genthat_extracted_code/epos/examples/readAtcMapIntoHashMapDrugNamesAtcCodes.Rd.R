library(epos)


### Name: readAtcMapIntoHashMapDrugNamesAtcCodes
### Title: Processes the input file db-atc.map to form a HashMap containing
###   the drug names with ATC codes
### Aliases: readAtcMapIntoHashMapDrugNamesAtcCodes

### ** Examples

atchashda <- readAtcMapIntoHashMapDrugNamesAtcCodes(
  system.file("extdata", "db-atc.map", package = "epos"), "\t")



