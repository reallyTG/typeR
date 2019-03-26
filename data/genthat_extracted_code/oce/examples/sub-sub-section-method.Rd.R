library(oce)


### Name: [[,section-method
### Title: Extract Something From a Section Object
### Aliases: [[,section-method

### ** Examples

data(section)
length(section[["latitude"]])
length(section[["latitude", "byStation"]])
# Vector of all salinities, for all stations
Sv <- section[["salinity"]]
# List of salinities, grouped by station
Sl <- section[["salinity", "byStation"]]
# First station salinities
Sl[[1]]




