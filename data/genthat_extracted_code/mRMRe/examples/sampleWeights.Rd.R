library(mRMRe)


### Name: sampleWeights
### Title: Accessor function for the 'sampleWeights' information in a
###   mRMRe.Data object
### Aliases: sampleWeights sampleWeights<- sampleWeights,mRMRe.Data-method
###   sampleWeights<-,mRMRe.Data-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))

# Uniform weight (default)
sampleWeights(feature_data)

# Random weighting  
sampleWeights(feature_data) <- runif(sampleCount(feature_data))
# Show result
sampleWeights(feature_data)



