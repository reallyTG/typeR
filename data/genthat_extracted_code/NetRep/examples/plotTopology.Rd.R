library(NetRep)


### Name: plotTopology
### Title: Plot a topological feature of network module
### Aliases: plotTopology plotData plotCorrelation plotNetwork
###   plotContribution plotDegree plotSummary
### Keywords: internal

### ** Examples

# load in example data, correlation, and network matrices for a discovery and test dataset:
data("NetRep")

# Set up input lists for each input matrix type across datasets. The list
# elements can have any names, so long as they are consistent between the
# inputs.
network_list <- list(discovery=discovery_network, test=test_network)
data_list <- list(discovery=discovery_data, test=test_data)
correlation_list <- list(discovery=discovery_correlation, test=test_correlation)
labels_list <- list(discovery=module_labels)

# Plot the data for module 1, 2 and 4 in the discovery dataset
plotData(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4)
)

# Symmetric = TRUE gives a traditional heatmap for the correlation structure
# and weighted network
plotCorrelation(
  network=network_list, data=data_list, correlation=correlation_list,
  moduleAssignments=labels_list, modules=c(1, 2, 4), symmetric=TRUE
)

# While the default is to render only one half of the (symmetric) matrix
plotNetwork(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4)
)

# Plot the degree of nodes in each module in the test dataset, but show them
# in the same order as the discovery dataset to compare how node degree 
# changes
plotDegree(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4), discovery="discovery",
  test="test"
)

# Alternatively nodes can be ordered on the plot by degree in the test dataset
plotDegree(
  network=network_list, data=data_list, correlation=correlation_list,
  moduleAssignments=labels_list, modules=c(1, 2, 4), discovery="discovery",
  test="test", orderNodesBy="test"
)

# Or by averaging the degree across datasets for a more robust ordering  
plotDegree(
 network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4), discovery="discovery",
  test="test", orderNodesBy=c("discovery", "test")
)

# Arbitrary subsets can be plotted:
plotContribution(
  network=network_list[[1]][1:10, 1:10], data=data_list[[1]][, 1:10], 
  correlation=correlation_list[[1]][1:10, 1:10], orderNodesBy=NA
)

# Plot the module summary vectors for multiple modules:
plotSummary(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4), discovery="discovery",
  test="test", orderSamplesBy="test"
)




