library(randomLCA)


### Name: maxPostClass
### Title: Determines class with maximum posterior class probability for
###   each observation
### Aliases: maxPostClass maxPostClass.randomLCA
### Keywords: methods

### ** Examples

pap.lca2 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=2)
maxClass.lca2 <- maxPostClass(pap.lca2)
names(maxClass.lca2)[length(names(maxClass.lca2))] <- "maxProb.lca2"

pap.lca3 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=3)
maxClass.lca3 <- maxPostClass(pap.lca3)
names(maxClass.lca3)[length(names(maxClass.lca3))] <- "maxProb.lca3"

maxClass <- merge(maxClass.lca2,maxClass.lca3)
# aggregate because there is more than one record for each combination
# shows the relationship between the 2 and 3 class models
print(aggregate(maxClass$Freq,list(maxProb2=maxClass$maxProb.lca2,
    maxProb3=maxClass$maxProb.lca3),sum))



