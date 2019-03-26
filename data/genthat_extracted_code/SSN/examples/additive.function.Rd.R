library(SSN)


### Name: additive.function
### Title: Generate an Additive Function Value
### Aliases: additive.function

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
#  predpts = "pred1km", o.write = TRUE)
#use mf04p SpatialStreamNetwork object, already created
data(mf04p)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04p <- updatePath(mf04p, paste0(tempdir(),'/MiddleFork04.ssn'))

#Calculate an additive function value based on an existing column.
names(mf04p@data)
mf04p <- additive.function(mf04p, "h2oAreaKm2", "areaAFV")
#notice that a column called afvArea was already included, and "areaAFV" replicates it
# in the lines data
head(mf04p@data)
# and in the observed points data
head(getSSNdata.frame(mf04p))
# and in the prediction points data
head(getSSNdata.frame(mf04p, "pred1km"))




