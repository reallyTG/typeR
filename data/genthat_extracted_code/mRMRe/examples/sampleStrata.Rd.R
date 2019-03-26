library(mRMRe)


### Name: sampleStrata
### Title: Accessor function for the 'sampleStrata' information in a
###   mRMRe.Data object
### Aliases: sampleStrata sampleStrata<- sampleStrata,mRMRe.Data-method
###   sampleStrata<-,mRMRe.Data-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))

# No stratification (default)
sampleStrata(feature_data)

# Random stratification 
sampleStrata(feature_data) <- as.factor(sample(c(0,1), 
  sampleCount(feature_data), replace=TRUE))
# Show result
sampleStrata(feature_data)



