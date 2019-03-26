library(SSN)


### Name: subsetSSN
### Title: Subset a SpatialStreamNetwork Object
### Aliases: subsetSSN

### ** Examples

library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# Create a SpatialStreamNetork object
ssn <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), o.write = TRUE)

ssn.sub1 <- subsetSSN(ssn, filename = 
  paste(tempdir(),"/subset1.ssn", sep = ""), subset = Summer_mn > 13)

# another example
#ssn.sub2 <- subsetSSN(ssn, filename = 
#  paste(tempdir(),"/subset2.ssn", sep = ""), subset = netID == 1, clip = TRUE)





