library(UNCLES)


### Name: uncles
### Title: UNCLES
### Aliases: uncles
### Keywords: ~UNCLES ~Clustering

### ** Examples

# This is the simplist way to apply UNCLES and MN plots.
# Just pass the datasets to the "uncles" function and then pass
# the UNCLES result to the "mnplots" function.
# Both functions will use default values for all other arguments.
#
# Define three random gene expression datasets for 1000 genes.
# The number of samples in the datasets are 6, 4, and 9, respectively.
#
# X = list()
# X[[1]] = matrix(rnorm(6000), 1000, 6)
# X[[2]] = matrix(rnorm(4000), 1000, 4)
# X[[3]] = matrix(rnorm(9000), 1000, 9)
#
# unclesResult <- uncles(X)
# mnResult <- mnplots(unclesResult)
#
# The clusters will be available in the form of a partition matrix in the variable:
# mnResult$B;



