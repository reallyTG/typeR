library(clusterGeneration)


### Name: genRandomClust
### Title: RANDOM CLUSTER GENERATION WITH SPECIFIED DEGREE OF SEPARATION
### Aliases: genRandomClust
### Keywords: cluster

### ** Examples

## Not run: 
##D tmp1 <- genRandomClust(numClust=7, sepVal=0.3, numNonNoisy=5,  
##D                 numNoisy=3, numOutlier=5, numReplicate=2, fileName="chk1")
## End(Not run)
## Not run: 
##D tmp2 <- genRandomClust(numClust=7, sepVal=0.3, numNonNoisy=5,  
##D                 numNoisy=3, numOutlier=5, numReplicate=2, 
##D                 covMethod="unifcorrmat", fileName="chk2")
## End(Not run)
## Not run: 
##D tmp3 <- genRandomClust(numClust=2, sepVal=-0.1, numNonNoisy=2,  
##D                 numNoisy=6, numOutlier=30, numReplicate=1, 
##D                 clustszind=1, clustSizeEq=80, rangeVar=c(10, 20),
##D                 covMethod="unifcorrmat", iniProjDirMethod="naive",
##D                 projDirMethod="fixedpoint", fileName="chk3")
## End(Not run)




