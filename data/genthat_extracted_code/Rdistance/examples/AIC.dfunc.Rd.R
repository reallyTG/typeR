library(Rdistance)


### Name: AIC.dfunc
### Title: AICc and related fit statistics for detection function objects
### Aliases: AIC.dfunc
### Keywords: model

### ** Examples

# Load the example dataset of sparrow detections from package
  data(sparrowDetectionData)
  
  # Fit detection function to perpendicular, off-transect distances
  dfunc <- dfuncEstim(dist~1,
                      detectionData=sparrowDetectionData, 
                      w.hi=150)
  
  # Compute fit statistics
  AIC(dfunc)  # AICc
  AIC(dfunc, criterion="AIC")  # AIC
  AIC(dfunc, criterion="BIC")  # BIC



