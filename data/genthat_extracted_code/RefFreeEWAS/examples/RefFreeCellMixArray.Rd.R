library(RefFreeEWAS)


### Name: RefFreeCellMixArray
### Title: Initialize Reference-Free Cell Mixture Projection
### Aliases: RefFreeCellMixArray

### ** Examples

data(HNSCC)
Y.shortTest <- Y.HNSCC.averageBetas[1:500,]
testArray2  <- RefFreeCellMixArray(Y.shortTest,Klist=1:5,iters=5)
sapply(testArray2,deviance,Y=Y.shortTest)

## Not run: 
##D testBootDevs <- RefFreeCellMixArrayDevianceBoots(testArray2,Y.shortTest,R=10)
##D 
##D testBootDevs
##D apply(testBootDevs[-1,],2,mean,trim=0.25)
##D which.min(apply(testBootDevs[-1,],2,mean,trim=0.25))
## End(Not run)



