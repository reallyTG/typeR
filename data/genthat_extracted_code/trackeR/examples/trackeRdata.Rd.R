library(trackeR)


### Name: trackeRdata
### Title: Create a trackeRdata object
### Aliases: trackeRdata

### ** Examples

## read raw data
filepath <- system.file('extdata/tcx/', '2013-06-08-090442.TCX', package = 'trackeR')
run0 <- readTCX(file = filepath, timezone = 'GMT')

## turn into trackeRdata object
units0 <- generate_units()
run0 <- trackeRdata(run0, units = units0)



