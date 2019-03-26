library(simFrame)


### Name: stratify-utilities
### Title: Utility functions for stratifying data
### Aliases: getStrataLegend getStrataLegend-methods
###   getStrataLegend,data.frame,BasicVector-method getStrataSplit
###   getStrataSplit-methods getStrataSplit,data.frame,BasicVector-method
###   getStrataTable getStrataTable-methods
###   getStrataTable,data.frame,BasicVector-method getStratumSizes
###   getStratumSizes-methods getStratumSizes,list,missing-method
###   getStratumSizes,data.frame,BasicVector-method getStratumValues
###   getStratumValues-methods
###   getStratumValues,data.frame,BasicVector,list-method
###   getStratumValues,data.frame,BasicVector,missing-method
### Keywords: manip methods

### ** Examples

data(eusilcP)

## all data
getStrataLegend(eusilcP, c("region", "gender"))
getStrataTable(eusilcP, c("region", "gender"))
getStratumSizes(eusilcP, c("region", "gender"))

## small sample
sam <- draw(eusilcP, size = 25)
getStrataSplit(sam, "gender")
getStratumValues(sam, "gender")



