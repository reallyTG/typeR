library(mRMRe)


### Name: causality
### Title: Accessor function for the 'causality' information in a
###   mRMRe.Filter and mRMRe.Network object.
### Aliases: causality causality,mRMRe.Filter-method
###   causality,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
causality(filter)



