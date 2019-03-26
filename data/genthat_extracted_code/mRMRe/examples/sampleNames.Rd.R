library(mRMRe)


### Name: sampleNames
### Title: Accessor function for the 'sampleNames' information in a
###   mRMRe.Data, mRMRe.Filter and mRMRe.Network object.
### Aliases: sampleNames sampleNames,mRMRe.Filter-method
###   sampleNames,mRMRe.Network-method sampleNames,mRMRe.Data-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))
sampleNames(feature_data)
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
sampleNames(filter)



