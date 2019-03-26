library(recluster)


### Name: recluster.region
### Title: A new clustering method based on continuous consensus.
### Aliases: recluster.region
### Keywords: cluster

### ** Examples

data(dataisl)
simpson<-recluster.dist(dataisl)
turn_cl<-recluster.region(simpson,tr=10,rettree=TRUE)
#plot the three for three clusters
plot(turn_cl$tree[[2]])
#inspect cluster membership
turn_cl$grouping



