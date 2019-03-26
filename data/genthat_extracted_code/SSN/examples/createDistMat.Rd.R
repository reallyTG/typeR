library(SSN)


### Name: createDistMat
### Title: Calculate Hydrologic Distances for a SpatialStreamNetwork Object
### Aliases: createDistMat

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

# create distance matrix among observed data points
createDistMat(mf04p, o.write = TRUE)

# create distance matrix among observed data points
#     and between observed and prediction points
createDistMat(mf04p, predpts = "pred1km", o.write = TRUE)

# NOT RUN include prediction to prediction site distances
# createDistMat(mf04p, predpts = "pred1km", o.write = TRUE, amongpreds = TRUE)




