library(oce)


### Name: [[,oce-method
### Title: Extract Something From an oce Object
### Aliases: [[,oce-method

### ** Examples

data(ctd)
ctd[["longitude"]] # in metadata
head(ctd[["salinity"]]) # in data
data(section)
summary(section[["station", 1]])



