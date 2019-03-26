library(Rdistance)


### Name: abundEstim
### Title: Estimate abundance from distance-sampling data
### Aliases: abundEstim
### Keywords: model

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)
data(sparrowSiteData)

# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=sparrowDetectionData,
                    likelihood="halfnorm", w.hi=100, pointSurvey=FALSE)

# Estimate abundance given a detection function
# Note, area=10000 converts to density per hectare (for distances measured in meters)
# Note, a person should do more than R=20 iterations
fit <- abundEstim(dfunc, detectionData=sparrowDetectionData,
                  siteData=sparrowSiteData, area=10000, R=20, ci=0.95,
                  plot.bs=TRUE, bySite=FALSE)

# Print results
fit
         



