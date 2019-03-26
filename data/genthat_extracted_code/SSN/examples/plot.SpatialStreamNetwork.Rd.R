library(SSN)


### Name: plot.SpatialStreamNetwork
### Title: Plotting Method for SpatialStreamNetwork Objects
### Aliases: plot.SpatialStreamNetwork summary.SpatialStreamNetwork

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
mf04p <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'), 
  predpts = "pred1km", o.write = TRUE)
names(mf04p)
summary(mf04p)

#generic plotting includes stream network and observed locations
plot(mf04p)

#plot including the color coding the response variable
plot(mf04p, "Summer_mn")

#plot using user-defined breakpoints
plot(mf04p, "Summer_mn", breaktype = "user", brks = seq(8,16,by=1))

#pass normal plotting arguments, such as xlab and ylab, to plot
plot(mf04p, "Summer_mn", xlab = "x-coordinate", ylab = "y-coordinate")

# plot observations and prediction values
plot(mf04p, "Summer_mn", cex = 2, xlab = "x", ylab = "y")
plot(mf04p, PredPointsID = "pred1km", addWithLegend = TRUE)




