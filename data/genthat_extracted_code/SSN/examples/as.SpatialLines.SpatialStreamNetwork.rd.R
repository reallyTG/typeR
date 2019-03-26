library(SSN)


### Name: as.SpatialLines
### Title: Methods to convert SpatialStreamNetwork objects classes to sp
###   classes
### Aliases: as.SpatialLines as.SpatialPoints as.SpatialLinesDataFrame
###   as.SpatialPointsDataFrame as.SpatialLines.SpatialStreamNetwork
###   as.SpatialPoints.SpatialStreamNetwork
###   as.SpatialLinesDataFrame.SpatialStreamNetwork
###   as.SpatialPointsDataFrame.SpatialStreamNetwork

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

#---------
# make plots using sp methods
#---------
#plot the stream lines
plot(as.SpatialLines(mf04p), col = "blue")
# add the observed locations with size proportional 
# to mean summer temperature
plot(as.SpatialPoints(mf04p), pch = 19, 
  cex = as.SpatialPointsDataFrame(mf04p)$Summer_mn/9 , add = TRUE)
# add the prediction locations on the 1 km spacing
plot(as.SpatialPoints(mf04p, data = "pred1km"), cex = 1.5, add = TRUE)
# add the dense set of points for block prediction on Knapp segment
plot(as.SpatialPoints(mf04p, data = "Knapp"), pch = 19, cex = 0.3, 
  col = "red", add = TRUE)




