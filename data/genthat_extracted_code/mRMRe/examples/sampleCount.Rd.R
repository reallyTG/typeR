library(mRMRe)


### Name: sampleCount
### Title: Accessor function for the 'sampleCount' information in a
###   mRMRe.Data, mRMRe.Filter and mRMRe.Network object.
### Aliases: sampleCount sampleCount,mRMRe.Data-method
###   sampleCount,mRMRe.Filter-method sampleCount,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))
sampleCount(feature_data)
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
sampleCount(filter)



