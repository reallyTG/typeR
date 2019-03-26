library(NetRep)


### Name: sampleOrder
### Title: Order samples within a network.
### Aliases: sampleOrder
### Keywords: internal utilities

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

# Sort nodes within module 1 in descending order by module summary
samples <- sampleOrder(
  network=network_list, data=data_list, correlation=correlation_list,
  moduleAssignments=labels_list, modules="1" 
)




