library(Rdistance)


### Name: coef.dfunc
### Title: Coefficients of an estimated detection function
### Aliases: coef.dfunc
### Keywords: model

### ** Examples

# Load example sparrow data (line transect survey type)
data(sparrowDetectionData)

# Fit half-normal detection function
dfunc <- dfuncEstim(formula=dist~1,
                    detectionData=sparrowDetectionData,
                    likelihood="halfnorm", w.hi=100, pointSurvey=FALSE)

# Print results
dfunc
  
# Extract the coefficient(s)
coef(dfunc)



