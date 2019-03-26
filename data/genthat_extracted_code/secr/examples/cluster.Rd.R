library(secr)


### Name: cluster
### Title: Detector Clustering
### Aliases: cluster clusterID clustertrap clusterID<- clustertrap<-
### Keywords: manip

### ** Examples


## 81 4-detector clusters
mini <- make.grid(nx = 2, ny = 2)
tempgrid <- trap.builder (cluster = mini , method = "all",
    frame = expand.grid(x = seq(100, 900, 100), y = seq(100,
    900, 100)))
clusterID(tempgrid)
clustertrap(tempgrid)

tempCH <- sim.capthist(tempgrid)
table(clusterID(tempCH)) ## detections per cluster
cluster.counts(tempCH)   ## distinct individuals




