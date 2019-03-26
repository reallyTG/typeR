library(polyRAD)


### Name: SubsetByTaxon
### Title: Create RADdata Object with a Subset of Taxa
### Aliases: SubsetByTaxon SubsetByTaxon.RADdata
### Keywords: manip

### ** Examples

# load data for this example
data(exampleRAD)
exampleRAD

# just keep the first fifty taxa
subsetRAD <- SubsetByTaxon(exampleRAD, 1:50)
subsetRAD




