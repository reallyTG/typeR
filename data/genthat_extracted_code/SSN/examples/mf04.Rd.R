library(SSN)


### Name: mf04
### Title: imported SpatialStreamNetwork object from MiddleFork04.ssn data
###   folder
### Aliases: mf04

### ** Examples

library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), o.write = TRUE)
names(mf04)



