library(mRMRe)


### Name: visualize
### Title: mRMRe Network display
### Aliases: visualize visualize,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Build an mRMR-based network and display it
network <- new("mRMRe.Network", data = feature_data, target_indices = c(1),
				levels = c(3, 1), layers = 2)
visualize(network)



