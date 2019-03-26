library(graphscan)


### Name: france_two_clusters
### Title: A 2D cluster example: France with two clusters.
### Aliases: france_two_clusters france
### Keywords: datasets

### ** Examples

data(france_two_clusters)
sp::plot(france)
points(france_two_clusters[france_two_clusters$cases==1,],
pch=16,col="red")
points(france_two_clusters[france_two_clusters$cases==0,],
pch=16,cex=0.2,col="green")



