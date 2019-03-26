library(mRMRe)


### Name: target
### Title: mRMR Target(s)
### Aliases: target target,mRMRe.Filter-method target,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Create an mRMR filter and obtain the targets of that filter
filter <- mRMR.classic("mRMRe.Filter", data = feature_data, target_indices = 3:5,
						feature_count = 2)
target(filter)

# Build an mRMR-based network and obtain targets (seeds) of the network
network <- new("mRMRe.Network", data = feature_data, target_indices = c(1, 2),
				levels = c(2, 1), layers = 1)
target(network)



