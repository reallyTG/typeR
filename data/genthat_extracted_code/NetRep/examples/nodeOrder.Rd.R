library(NetRep)


### Name: nodeOrder
### Title: Order nodes in descending order of _weighted degree_ and order
###   modules by the similarity of their summary vectors.
### Aliases: nodeOrder
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

# Sort modules by similarity and nodes within each module by their weighted 
# degree
nodes <- nodeOrder(
  network=network_list, data=data_list, correlation=correlation_list,  
  moduleAssignments=labels_list
)




