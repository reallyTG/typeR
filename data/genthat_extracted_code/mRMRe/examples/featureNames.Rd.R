library(mRMRe)


### Name: featureNames
### Title: Accessor function for the 'featureNames' information in a
###   mRMRe.Data, mRMRe.Filter and mRMRe.Network object
### Aliases: featureNames featureNames,mRMRe.Filter-method
###   featureNames,mRMRe.Network-method featureNames,mRMRe.Data-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))
featureNames(feature_data)
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
featureNames(filter)



