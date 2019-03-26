library(SSN)


### Name: writeSSN
### Title: Write a SpatialStreamNetwork Object
### Aliases: writeSSN

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
  predpts = "pred1km", o.write = TRUE)

writeSSN(mf04p, filename = paste0(tempdir(),"/tempFile.ssn"))




