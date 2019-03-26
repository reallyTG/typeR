library(RWDataPlyr)


### Name: getArrayThresholdExceedance
### Title: Get values at the input exceedance levels for the entire array
###   by date
### Aliases: getArrayThresholdExceedance
### Keywords: internal

### ** Examples

pe <- RWDataPlyr:::rdfSlotToXTS(keyRdf, 'Mead.Pool Elevation')
peLT3575 <- RWDataPlyr:::getArrayThresholdExceedance(pe, 3575, 'LT')




