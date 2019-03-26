library(RefFreeEWAS)


### Name: RefFreeCellMixInitializeBySVD
### Title: Initialize Reference-Free Cell Mixture Projection by SVD
### Aliases: RefFreeCellMixInitializeBySVD

### ** Examples

data(HNSCC)
Y.shortTest <- Y.HNSCC.averageBetas[1:500,]
mu.start.svd <- RefFreeCellMixInitializeBySVD(Y.shortTest)
testArray2  <- RefFreeCellMixArrayWithCustomStart(Y.shortTest, mu.start=mu.start.svd,
    Klist=1:3,iters=5)
sapply(testArray2,deviance,Y=Y.shortTest)

## Not run: 
##D testBootDevs <- RefFreeCellMixArrayBySVDDevianceBoots(testArray2,Y.shortTest,R=10)
##D 
##D testBootDevs
##D apply(testBootDevs[-1,],2,mean,trim=0.25)
##D which.min(apply(testBootDevs[-1,],2,mean,trim=0.25))
## End(Not run)



