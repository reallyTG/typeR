library(oce)


### Name: dataLabel
### Title: Try to associate data names with units, for use by summary()
### Aliases: dataLabel

### ** Examples

library(oce)
data(ctd)
dataLabel(names(ctd@data), ctd@metadata$units)



