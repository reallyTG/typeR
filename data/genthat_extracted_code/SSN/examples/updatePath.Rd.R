library(SSN)


### Name: updatePath
### Title: Update Path Slot in SpatialStreamNetwork Object
### Aliases: updatePath

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


## UPDATE PATH FOR glmssn object
## get some model fits stored as data objects
data(modelFits)
## NOT RUN
## Fit a model to binary data
## binSp <- glmssn(MaxOver20 ~ ELEV_DEM + SLOPE, mf04p,
##   CorModels = c("Mariah.tailup", "Spherical.taildown"),
##   family = "binomial", addfunccol = "afvArea")
##for examples only, make sure binSp has the correct path
##if you use importSSN(), path will be correct
binSp$ssn.object <- updatePath(binSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))
summary(binSp)




