library(Rnightlights)


### Name: listCtryNlData
### Title: List available data
### Aliases: listCtryNlData

### ** Examples

#list all data
listCtryNlData()

#list all data available for KEN
listCtryNlData(ctryCodes = "KEN")

#list all VIIRS.* data available for ECU
listCtryNlData(ctryCodes = "ECU", nlTypes = "VIIRS")

#list available OLS.Y data for KEN and RWA in 2012 & 2013
listCtryNlData(ctryCodes = c("KEN","RWA"), nlPeriods = c("2012", "2013"), nlTypes = "OLS.Y")




