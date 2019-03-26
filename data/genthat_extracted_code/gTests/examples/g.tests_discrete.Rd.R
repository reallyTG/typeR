library(gTests)


### Name: g.tests_discrete
### Title: Graph-based two-sample tests for discrete data
### Aliases: g.tests_discrete

### ** Examples

# the "example_discrete" data contains three two-sample counts data 
# represted in the matrix form: counts1, counts2, counts3 
# and the corresponding distance matrix on the distinct values: ds1, ds2, ds3.
data(example_discrete) 

# counts1 is a K by 2 matrix, where K is the number of distinct values. 
# It specifies the counts in the K distinct values for the two samples. 
# ds1 is the corresponding distance matrix on the distinct values. 
# The data is generated from two samples with mean shift.
Knnl = 3
E1 = getGraph(counts1, ds1, Knnl, graph = "nnlink")
g.tests_discrete(E1, counts1)
 
# counts2 is a K by 2 matrix, where K is the number of distinct values. 
# It specifies the counts in the K distinct values for the two samples. 
# ds2 is the corresponding distance matrix on the distinct values. 
# The data is generated from two samples with spread difference.
Kmst = 6
E2 = getGraph(counts2, ds2, Kmst, graph = "mstree")
g.tests_discrete(E2, counts2)
 
# counts3 is a K by 2 matrix, where K is the number of distinct values. 
# It specifies the counts in the K distinct values for the two samples. 
# ds3 is the corresponding distance matrix on the distinct values. 
# The data is generated from two samples with mean shift and spread difference.
Knnl = 3
E3 = getGraph(counts3, ds3, Knnl, graph = "nnlink")
g.tests_discrete(E3, counts3)

## Uncomment the following line to get permutation p-value with 200 permutations.
# Knnl = 3
# E1 = getGraph(counts1, ds1, Knnl, graph = "nnlink")
# g.tests_discrete(E1, counts1, test.type = "all", maxtype.kappa = 1.31, perm = 300)



