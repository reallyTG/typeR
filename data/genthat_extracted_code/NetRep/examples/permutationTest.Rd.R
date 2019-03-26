library(NetRep)


### Name: permutationTest
### Title: Permutation test P-values for module preservation statistics
### Aliases: permutationTest permutation permuted
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

# Note that we recommend running at least 10,000 permutations to make sure 
# that the null distributions are representative.

preservation <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=labels_list, nPerm=1000, discovery="discovery", 
 test="test"
)

# Re-calculate the permutation test P-values
p.values <- permutationTest(
  preservation$nulls, preservation$observed, preservation$nVarsPresent,
  preservation$totalSize, preservation$alternative
)




