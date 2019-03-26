library(NetRep)


### Name: modulePreservation
### Title: Replication and preservation of network modules across datasets
### Aliases: modulePreservation

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

# Assess module preservation: you should run at least 10,000 permutations
preservation <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=labels_list, nPerm=1000, discovery="discovery", 
 test="test", nThreads=2
)




