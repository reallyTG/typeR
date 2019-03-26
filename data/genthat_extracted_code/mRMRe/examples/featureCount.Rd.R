library(mRMRe)


### Name: featureCount
### Title: Accessor function for the 'featureCount' information in a
###   mRMRe.Data, mRMRe.Filter and mRMRe.Network object.
### Aliases: featureCount featureCount,mRMRe.Data-method
###   featureCount,mRMRe.Filter-method featureCount,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))
featureCount(feature_data)
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
featureCount(filter)



