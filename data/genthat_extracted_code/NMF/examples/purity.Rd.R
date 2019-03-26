library(NMF)


### Name: purity
### Title: Purity and Entropy of a Clustering
### Aliases: entropy entropy,ANY,ANY-method entropy,factor,ANY-method
###   entropy-methods entropy,NMFfitXn,ANY-method
###   entropy,table,missing-method purity purity,ANY,ANY-method
###   purity,factor,ANY-method purity-methods purity,NMFfitXn,ANY-method
###   purity,table,missing-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate a synthetic dataset with known classes: 50 features, 18 samples (5+5+8)
n <- 50; counts <- c(5, 5, 8);
V <- syntheticNMF(n, counts)
cl <- unlist(mapply(rep, 1:3, counts))

# perform default NMF with rank=2
x2 <- nmf(V, 2)
purity(x2, cl)
entropy(x2, cl)
# perform default NMF with rank=2
x3 <- nmf(V, 3)
purity(x3, cl)
entropy(x3, cl)



