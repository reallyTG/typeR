library(SSN)


### Name: importSSN
### Title: Import an object of class SpatialStreamNetwork
### Aliases: importSSN

### ** Examples


library(SSN)
# for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()

# Create a SpatialStreamNetwork object that does not contain prediction points
mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), o.write = TRUE)

# Create a SpatialStreamNetork object that also contains prediction sites
mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
  predpts = "pred1km", o.write = TRUE)
names(mf04p)

#NOT RUN Some graphics to explore imported object
#hist(mf04, "Summer_mn")
#boxplot(mf04, "Summer_mn")
#plot(mf04, cex = .8, xlab = "x", ylab = "y")
#plot(mf04p, PredPointsID = "pred1km", add = TRUE, pch = 1) #add to previous plot




