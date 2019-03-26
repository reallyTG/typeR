library(mRMRe)


### Name: scores
### Title: mRMR Scores as per the MI gain for each feature
### Aliases: scores scores,mRMRe.Data-method scores,mRMRe.Filter-method
###   scores,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Create an mRMR filter and obtain the indices of selected features
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
scores(filter)



