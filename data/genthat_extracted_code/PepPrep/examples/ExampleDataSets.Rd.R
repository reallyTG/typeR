library(PepPrep)


### Name: ExampleDataSets
### Title: Summary of example data sets.
### Aliases: ExampleDataSets
### Keywords: datasets

### ** Examples

testtbl <- system.file("extdata", "ExampleData.RData", package="PepPrep")
load(testtbl)
testtbl
attributes(testtbl)
lapply(testtbl,class)




