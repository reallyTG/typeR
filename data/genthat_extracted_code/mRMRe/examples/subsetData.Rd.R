library(mRMRe)


### Name: subsetData
### Title: Returns a mRMRe.Data object using a subset of the current
###   mRMRe.Data object.
### Aliases: subsetData subsetData,mRMRe.Data-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data = data.frame(cgps.ge))
# Subset the same dimensions, equivalent to making a copy
feature_data_copy <- subsetData(feature_data, 
    row_indices=sampleCount(feature_data),
		column_indices=featureCount(feature_data))

# Use only half of the samples
feature_data_samples <- subsetData(feature_data, row_indices=sampleCount(feature_data)/2)

# Use only half of the features
feature_data_features <- subsetData(feature_data,
    column_indices=featureCount(feature_data))



