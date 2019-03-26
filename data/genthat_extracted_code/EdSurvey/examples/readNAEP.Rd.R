library(EdSurvey)


### Name: readNAEP
### Title: Connect to NAEP Data
### Aliases: readNAEP

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
sdf

## Not run: 
##D # To read in an NCES file first set the directory to the ~/Data subfolder,
##D # then read in the appropriate .dat file:
##D setwd("location/of/Data")
##D sdf <- readNAEP(path="M36NT2PM.dat")
##D 
##D # Or read in the .dat file directly through the folder pathway:
##D sdf <- readNAEP(path="location/of/Data/M36NT2PM.dat")
## End(Not run)



