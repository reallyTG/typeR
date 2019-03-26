library(NetworkComparisonTest)


### Name: NetworkComparisonTest
### Title: Statistical Comparison of Two Networks Based on Three Invariance
###   Measures
### Aliases: NetworkComparisonTest NCT

### ** Examples

library("IsingSampler")
library("IsingFit")

### Simulate binary datasets under null hypothesis:
### underlying network structures have the same strength 
# Input:
N <- 6 # Number of nodes
nSample <- 500 # Number of samples

# Ising parameters:
Graph <- matrix(sample(0:1,N^2,TRUE,prob = c(0.8, 0.2)),N,N) * runif(N^2,0.5,2)
Graph <- pmax(Graph,t(Graph))
diag(Graph) <- 0
Thresh <- -rowSums(Graph) / 2

# Simulate:
data1 <- IsingSampler(nSample, Graph, Thresh)
data2 <- IsingSampler(nSample, Graph, Thresh)

### Compare networks of data sets using NCT ###
# with gamma = 0. Iterations set to 10 to save time. Should be 1000 at least.

# Testing on all three aspects
# 2 edges are tested here: between variable 1 and 2, 
# and between 3 and 6 (can be list(c(2,1),c(6,3)) as well)
Res_1 <- NCT(data1, data2, gamma=0, it=10, binary.data = TRUE, 
test.edges=TRUE, edges=list(c(1,2),c(3,6)))

## Plotting of NCT results
## See the help file of plot.NCT for more information about the plotting function and its arguments

# Plot results of the network structure invariance test (not reliable with only 10 permutations!):
plot(Res_1, what="network")

# Plot results of global strength invariance test (not reliable with only 10 permutations!):
plot(Res_1, what="strength")

# Plot results of the edge invariance test (not reliable with only 10 permutations!):
# Note that two distributions are plotted
plot(Res_1, what="edge")

# Without testing for (an) individual edge(s)
# The arguments 'test.edges' and 'edges' don't need to be specified
# Not run
# Res_0 <- NCT(data1, data2, gamma=0, it=10, binary.data = TRUE)



