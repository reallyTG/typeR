library(clValid)


### Name: clValid-class
### Title: Class "clValid"
### Aliases: clValidObj clValid-class clusterMethods,clValid-method
###   clusters,clValid-method measNames,clValid-method
###   measures,clValid-method nClusters,clValid-method
###   optimalScores,clValid-method clusterMethods clusters measNames
###   measures nClusters optimalScores plot,clValid,missing-method
###   print,clValid-method show,clValid-method summary,clValid-method
### Keywords: classes cluster

### ** Examples


## to delete
library(clValid)


data(mouse)

## internal validation
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
intern <- clValid(express, 2:6, clMethods=c("hierarchical","kmeans","pam"),
                  validation="internal")
slotNames(intern)

## view results
intern
summary(intern)
optimalScores(intern)
plot(intern)

## Extract objects from slots
measures(intern)
hierClust <- clusters(intern,"hierarchical")
plot(hierClust)
measNames(intern)
nClusters(intern)




