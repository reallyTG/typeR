library(Rdistance)


### Name: print.dfunc
### Title: Print a distance function object
### Aliases: print.dfunc
### Keywords: models

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)

# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=sparrowDetectionData,
                    likelihood="halfnorm", w.hi=100, pointSurvey=FALSE)

# Print results
dfunc
print(dfunc, criterion="BIC")




