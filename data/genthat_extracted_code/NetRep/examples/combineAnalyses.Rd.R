library(NetRep)


### Name: combineAnalyses
### Title: Combine results of multiple permutation procedures
### Aliases: combineAnalyses
### Keywords: internal

### ** Examples

data("NetRep")

# Set up input lists for each input matrix type across datasets. The list
# elements can have any names, so long as they are consistent between the
# inputs.
network_list <- list(discovery=discovery_network, test=test_network)
data_list <- list(discovery=discovery_data, test=test_data)
correlation_list <- list(discovery=discovery_correlation, test=test_correlation)
labels_list <- list(discovery=module_labels)

pres1 <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list,
 moduleAssignments=labels_list, nPerm=1000, discovery="discovery", 
 test="test", nThreads=2
)

pres2 <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=labels_list, nPerm=1000, discovery="discovery", 
 test="test", nThreads=2
)

combined <- combineAnalyses(pres1, pres2)




