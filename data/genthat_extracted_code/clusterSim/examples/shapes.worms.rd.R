library(clusterSim)


### Name: shapes.worms
### Title: Generation of data set containing two clusters with untypical
###   parabolic shapes (worms)
### Aliases: shapes.worms
### Keywords: cluster,dataset

### ** Examples

library(clusterSim)
sw<-shapes.worms(180)
plot(sw$data,col=rainbow(2)[sw$clusters])



