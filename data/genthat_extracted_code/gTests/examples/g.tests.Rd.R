library(gTests)


### Name: g.tests
### Title: Graph-based two-sample tests
### Aliases: g.tests

### ** Examples

# the "example" data contains three similarity graphs represted in the matrix form: E1, E2, E3.
data(example) 
 
# E1 is an edge matrix representing a similarity graph.
# It is constructed on two samples with mean difference.
# Sample 1 indices: 1:100; sample 2 indices: 101:250.
g.tests(E1, 1:100, 101:250) 

# E2 is an edge matrix representing a similarity graph.
# It is constructed on two samples with variance difference.
# Sample 1 indices: 1:100; sample 2 indices: 101:250.
g.tests(E2, 1:100, 101:250)

# E3 is an edge matrix representing a similarity graph.
# It is constructed on two samples with mean and variance difference.
# Sample 1 indices: 1:100; sample 2 indices: 101:250.
g.tests(E3, 1:100, 101:250)

## Uncomment the following line to get permutation p-value with 200 permutations.
# g.tests(E1, 1:100, 101:250, perm=200)



