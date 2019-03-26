library(mRMRe)


### Name: adjacencyMatrix
### Title: Accessor function for the 'adjacencyMatrix' information in a
###   mRMRe.Network object.
### Aliases: adjacencyMatrix adjacencyMatrixSum
###   adjacencyMatrix,mRMRe.Network-method
###   adjacencyMatrixSum,mRMRe.Network-method
### Keywords: methods

### ** Examples

set.thread.count(2)
data(cgps)
feature_data <- mRMR.data(data =  data.frame(cgps.ge))

# Build an mRMR-based network and display adjacency matrix (topology)
network <- new("mRMRe.Network", data = feature_data, target_indices = c(1, 2),
			levels = c(2, 1), layers = 1)
adjacencyMatrix(network)



