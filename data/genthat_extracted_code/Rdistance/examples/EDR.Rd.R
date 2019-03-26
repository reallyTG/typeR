library(Rdistance)


### Name: EDR
### Title: Effective Detection Radius (EDR) for estimated detection
###   functions with point transects
### Aliases: EDR
### Keywords: modeling

### ** Examples

# Load example thrasher data (point transect survey type)
data(thrasherDetectionData)

# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=thrasherDetectionData,
                    likelihood="halfnorm", w.hi=175, pointSurvey=TRUE)

# Compute effective detection radius (EDR)
EDR(dfunc)

# EDR only applies to point transect surveys
# ESW is the line transect equivalent
# The effectiveDistance function tests whether the dfunc was
# fit to line or point data, and returns either ESW or EDR accordingly
effectiveDistance(dfunc)
  



