library(mRMRe)


### Name: solutions
### Title: Basic result of the mRMR procedure
### Aliases: solutions solutions,mRMRe.Filter-method
###   solutions,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Create an mRMR filter and obtain the indices of selected features
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
solutions(filter)

# Build an mRMR-based network and obtain feature connections (topology)
network <- new("mRMRe.Network", data = feature_data, target_indices = c(1, 2),
			levels = c(2, 1), layers = 1)
solutions(network)



