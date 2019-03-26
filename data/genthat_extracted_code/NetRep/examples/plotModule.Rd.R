library(NetRep)


### Name: plotModule
### Title: Plot the topology of a network module
### Aliases: plotModule

### ** Examples

# load in example data, correlation, and network matrices for a discovery 
# and test dataset:
data("NetRep")

# Set up input lists for each input matrix type across datasets. The list
# elements can have any names, so long as they are consistent between the
# inputs.
network_list <- list(discovery=discovery_network, test=test_network)
data_list <- list(discovery=discovery_data, test=test_data)
correlation_list <- list(discovery=discovery_correlation, test=test_correlation)
labels_list <- list(discovery=module_labels)

# Plot module 1, 2 and 4 in the discovery dataset
plotModule(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 2, 4)
)

# Now plot them in the test dataset (module 2 does not replicate)
plotModule(
  network=network_list,data=data_list, correlation=correlation_list,
  moduleAssignments=labels_list, modules=c(1, 2, 4), discovery="discovery",
  test="test"
)

# Plot modules 1 and 4, which replicate, in the test datset ordering nodes
# by weighted degree averaged across the two datasets
plotModule(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list, modules=c(1, 4), discovery="discovery",
  test="test", orderNodesBy=c("discovery", "test")
)




