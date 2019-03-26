library(RWDataPlyr)


### Name: getArrayPctl
### Title: Get values at the input exceedance levels for the entire array
###   by date
### Aliases: getArrayPctl
### Keywords: internal

### ** Examples

pe <- RWDataPlyr:::rdfSlotToXTS(keyRdf, 'Mead.Pool Elevation')
pe105090 <- RWDataPlyr:::getArrayPctl(pe, c(0.1, 0.5, 0.9))




