library(NMF)


### Name: NMFfitXn-class
### Title: Structure for Storing All Fits from Multiple NMF Runs
### Aliases: NMFfitXn-class

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# generate a synthetic dataset with known classes
n <- 20; counts <- c(5, 2, 3);
V <- syntheticNMF(n, counts)

# get the class factor
groups <- V$pData$Group

# perform multiple runs of one algorithm, keeping all the fits
res <- nmf(V, 3, nrun=3, .options='k') # .options=list(keep.all=TRUE) also works
res

summary(res)
# get more info
summary(res, target=V, class=groups)

# compute/show computational times
runtime.all(res)
seqtime(res)

# plot the consensus matrix, computed on the fly
## Not run:  consensusmap(res, annCol=groups) 



