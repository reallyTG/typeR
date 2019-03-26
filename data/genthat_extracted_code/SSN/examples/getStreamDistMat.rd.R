library(SSN)


### Name: getStreamDistMat
### Title: Extract the stream network distance matrix from SSN objects
### Aliases: getStreamDistMat

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

names(mf04p)

distObs <- getStreamDistMat(mf04p)
str(distObs)
distObs$dist.net1[1:5,1:5]

# get total in-stream distance between all pairs of points
strDistNet2 <- distObs$dist.net2 + t(distObs$dist.net2)
strDistNet2[5:10,5:10]

# maximum distance to common junction between two sites
a.mat <- pmax(distObs$dist.net2,t(distObs$dist.net2))
a.mat[5:10,5:10]

# minimum distance to common junction between two sites
# sites with 0 minimum distance are flow-connected
b.mat <- pmin(distObs$dist.net2,t(distObs$dist.net2))
b.mat[5:10,5:10]

# get distance matrices between observed sites and prediction sites
distPred1km <- getStreamDistMat(mf04p, Name = "pred1km")
str(distPred1km)
distPred1km$dist.net1.a[1:5,1:5]

# create distance matrix among prediction sites
# note these sites only occur on the second network
# this is useful for block prediction
createDistMat(mf04p, predpts = "CapeHorn", o.write = TRUE, amongpreds = TRUE)
distCape <- getStreamDistMat(mf04p, Name = "CapeHorn")
str(distCape)
distCape$dist.net2[1:5,1:5]



