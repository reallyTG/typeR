library(Rdistance)


### Name: ESW
### Title: Effective Strip Width for line transect data
### Aliases: ESW
### Keywords: modeling

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)

# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=sparrowDetectionData,
                    likelihood="halfnorm", w.hi=100, pointSurvey=FALSE)

# Compute effective strip width (ESW)
ESW(dfunc)

# ESW only applies to line transect surveys
# EDR is the point transect equivalent
# The effectiveDistance function tests whether the dfunc was
# fit to line or point data, and returns either ESW or EDR accordingly
effectiveDistance(dfunc)



