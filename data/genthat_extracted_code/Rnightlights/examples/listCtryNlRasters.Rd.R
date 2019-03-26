library(Rnightlights)


### Name: listCtryNlRasters
### Title: List available cropped country rasters
### Aliases: listCtryNlRasters

### ** Examples

#list all rasters
listCtryNlRasters()

#list all rasters available for KEN
listCtryNlRasters(ctryCodes = "KEN")

#list all VIIRS rasters available for ECU
listCtryNlRasters(ctryCodes = "ECU", nlTypes = "VIIRS")

#list available OLS rasters for KEN and RWA in 2012 & 2013
listCtryNlRasters(ctryCodes = c("KEN","RWA"), nlPeriods = c("2012", "2013"), nlTypes = "OLS.Y")




