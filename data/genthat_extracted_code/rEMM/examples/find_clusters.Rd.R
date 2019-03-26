library(rEMM)


### Name: find_clusters
### Title: Find the EMM State/Cluster for an Observation
### Aliases: find_clusters find_clusters,tNN,numeric-method
###   find_clusters,tNN,matrix-method find_clusters,tNN,data.frame-method
### Keywords: models

### ** Examples

data("EMMTraffic")
emm <- EMM(measure="eJaccard", threshold=0.2)
emm <- build(emm, EMMTraffic)

find_clusters(emm, EMMTraffic)
find_clusters(emm, EMMTraffic, dist=TRUE)

## add noise to the data 
set.seed(1234)
newdata <- sapply(EMMTraffic, jitter, amount=15)
## default is exact match
find_clusters(emm, newdata, dist=TRUE)
## match with nearest neighbor
find_clusters(emm, newdata, match_cluster="nn", dist=TRUE)
## exact match only if within .5 times threshold
find_clusters(emm, newdata, match_cluster=.5, dist=TRUE)
## exact match only if within 2 times threshold
find_clusters(emm, newdata, match_cluster=2, dist=TRUE)



