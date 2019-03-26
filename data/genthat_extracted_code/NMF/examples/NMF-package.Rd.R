library(NMF)


### Name: NMF-package
### Title: Algorithms and framework for Nonnegative Matrix Factorization
###   (NMF).
### Aliases: NMF NMF-package
### Keywords: package

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate a synthetic dataset with known classes
n <- 50; counts <- c(5, 5, 8);
V <- syntheticNMF(n, counts)

# perform a 3-rank NMF using the default algorithm
res <- nmf(V, 3)

basismap(res)
coefmap(res)



