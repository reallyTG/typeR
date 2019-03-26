library(Rdistance)


### Name: dfuncEstim
### Title: Estimate a detection function from distance-sampling data
### Aliases: dfuncEstim
### Keywords: model

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)
data(sparrowSiteData)


# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=sparrowDetectionData,
                    likelihood="halfnorm", w.hi=100)

# Fit a second half-normal detection function, now including
# a categorical covariate for observer who surveyed the site (factor, 5 levels)
# Increase maximum iterations
dfuncObs <- dfuncEstim(formula=dist~observer,
                       detectionData=sparrowDetectionData,
                       siteData=sparrowSiteData,
                       likelihood="halfnorm", w.hi=100, pointSurvey=FALSE,
                       control=RdistanceControls(maxIter=1000))

# Print results
# And plot the detection function for each observer
dfuncObs
plot(dfuncObs,
     newdata=data.frame(observer=levels(sparrowSiteData$observer)))
     
# Show some plotting options
plot(dfuncObs, 
   newdata=data.frame(observer=levels(sparrowSiteData$observer)), 
   vertLines = FALSE, lty=c(1,1), 
   col.dfunc=heat.colors(length(levels(sparrowSiteData$observer))), 
   col=c("grey","lightgrey"), border=NA, 
   xlab="Distance (m)",
   main="Showing plot options")





