library(NetRep)


### Name: networkProperties
### Title: Calculate the topological properties for a network module
### Aliases: networkProperties

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

# Calculate the topological properties of all network modules in the discovery dataset
props <- networkProperties(
  network=network_list, data=data_list, correlation=correlation_list, 
  moduleAssignments=labels_list
)
  
# Calculate the topological properties in the test dataset for the same modules
test_props <- networkProperties(
  network=network_list, data=data_list, correlation=correlation_list,
  moduleAssignments=labels_list, discovery="discovery", test="test"
)




