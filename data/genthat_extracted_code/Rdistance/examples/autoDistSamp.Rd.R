library(Rdistance)


### Name: autoDistSamp
### Title: Automated classical distance analysis
### Aliases: autoDistSamp
### Keywords: model

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)
data(sparrowSiteData)

# Automate fitting multiple detection functions, and estimate abundance
# (density per ha in this case), given the 'best' detection function
# Note, area=10000 converts to density per ha (for distances measured in m)
# Note, users should do more than R=20 iterations of the bootstrap
autoDistSamp(formula=dist ~ 1,
             detectionData=sparrowDetectionData, siteData=sparrowSiteData,
             likelihood=c("halfnorm", "hazrate"), w.hi=100,
             series=c("cosine", "simple"), expansions=c(0, 1),
             area=10000, R=20, ci=0.95, bySite=FALSE,
             plot.bs=TRUE, plot=FALSE, pointSurvey=FALSE)



