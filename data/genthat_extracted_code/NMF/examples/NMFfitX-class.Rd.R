library(NMF)


### Name: NMFfitX-class
### Title: Virtual Class to Handle Results from Multiple Runs of NMF
###   Algorithms
### Aliases: NMFfitX-class

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate a synthetic dataset with known classes
n <- 20; counts <- c(5, 2, 3);
V <- syntheticNMF(n, counts)

# perform multiple runs of one algorithm (default is to keep only best fit)
res <- nmf(V, 3, nrun=3)
res

# plot a heatmap of the consensus matrix
## Not run:  consensusmap(res) 



