library(epos)


### Name: readAtcMapIntoHashMapAtcCodesAtcNames
### Title: Processes the input file db-atc.map to form a HashMap containing
###   the drug names with ATC codes
### Aliases: readAtcMapIntoHashMapAtcCodesAtcNames

### ** Examples

atchashaa <-
  readAtcMapIntoHashMapAtcCodesAtcNames(
    system.file("extdata", "db-atc.map", package = "epos"), "\t")



