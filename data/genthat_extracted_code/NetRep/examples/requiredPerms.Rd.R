library(NetRep)


### Name: requiredPerms
### Title: How many permutations do I need to test at my desired
###   significance level?
### Aliases: requiredPerms

### ** Examples

data("NetRep")

# Set up input lists for each input matrix type across datasets. The list
# elements can have any names, so long as they are consistent between the
# inputs.
network_list <- list(discovery=discovery_network, test=test_network)
data_list <- list(discovery=discovery_data, test=test_data)
correlation_list <- list(discovery=discovery_correlation, test=test_correlation)
labels_list <- list(discovery=module_labels)

# How many permutations are required to Bonferroni adjust for the 4 modules 
# in the example data? 
nPerm <- requiredPerms(0.05/4) 

# Note that we recommend running at least 10,000 permutations to make sure 
# that the null distributions are representative.

preservation <- modulePreservation(
 network=network_list, data=data_list, correlation=correlation_list, 
 moduleAssignments=labels_list, nPerm=nPerm, discovery="discovery", 
 test="test"
)




