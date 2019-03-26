library(trackeR)


### Name: readX
### Title: Read a training file in tcx, gpx, db3 or Golden Cheetah's JSON
###   format
### Aliases: readX readTCX readGPX readDB3 readJSON

### ** Examples

## read raw data
filepath <- system.file("extdata/tcx", "2013-06-08-090442.TCX", package = "trackeR")
run0 <- readTCX(file = filepath, timezone = "GMT")

## turn into trackeRdata object
units0 <- generate_units()
run0 <- trackeRdata(run0, units = units0)

## alternatively
## Not run: 
##D run0 <- read_container(filepath, type = "tcx", timezone = "GMT")
## End(Not run)




