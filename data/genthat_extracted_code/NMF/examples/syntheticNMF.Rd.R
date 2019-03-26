library(NMF)


### Name: syntheticNMF
### Title: Simulating Datasets
### Aliases: syntheticNMF

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate a synthetic dataset with known classes: 50 features, 18 samples (5+5+8)
n <- 50
counts <- c(5, 5, 8)

# no noise
V <- syntheticNMF(n, counts, noise=FALSE)
## Not run: aheatmap(V)

# with noise
V <- syntheticNMF(n, counts)
## Not run: aheatmap(V)



