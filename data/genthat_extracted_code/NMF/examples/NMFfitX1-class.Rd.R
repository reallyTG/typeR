library(NMF)


### Name: NMFfitX1-class
### Title: Structure for Storing the Best Fit Amongst Multiple NMF Runs
### Aliases: NMFfitX1-class

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

# perform multiple runs of one algorithm, keeping only the best fit (default)
#i.e.: the implicit nmf options are .options=list(keep.all=FALSE) or .options='-k'
res <- nmf(V, 3, nrun=3)
res

# compute summary measures
summary(res)
# get more info
summary(res, target=V, class=groups)

# show computational time
runtime.all(res)

# plot the consensus matrix, as stored (pre-computed) in the object
## Not run:  consensusmap(res, annCol=groups) 



