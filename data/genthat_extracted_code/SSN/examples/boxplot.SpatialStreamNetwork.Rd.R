library(SSN)


### Name: boxplot.SpatialStreamNetwork
### Title: Box-and-whisker plots for data within SpatialStreamNetwork
###   objects.
### Aliases: boxplot.SpatialStreamNetwork

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
#  predpts = "pred1km", o.write = TRUE)
#use mf04 SpatialStreamNetwork object, already created
data(mf04)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04 <- updatePath(mf04, paste0(tempdir(),'/MiddleFork04.ssn'))

boxplot(mf04, "Summer_mn")
boxplot(mf04, Summer_mn ~ STREAMNAME, main = "Summer_mn ~ STREAMNAME", 
      col = "gray", xlab = "STREAMNAME", ylab = "Summer Mean Temperature")




