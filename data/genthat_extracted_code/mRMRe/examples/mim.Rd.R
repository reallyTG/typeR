library(mRMRe)


### Name: mim
### Title: Accessor function for the 'mim' information in a mRMRe.Data,
###   mRMRe.Filter and mRMRe.Network object
### Aliases: mim mim,mRMRe.Data-method mim,mRMRe.Network-method
###   mim,mRMRe.Filter-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Calculate the pairwise mutual information matrix
mim(feature_data)
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)

# Obtain the sparse (lazy-evaluated) mutual information matrix.
mim(filter)



