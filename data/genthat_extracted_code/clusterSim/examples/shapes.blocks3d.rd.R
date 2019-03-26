library(clusterSim)


### Name: shapes.blocks3d
### Title: Generation of data set containing two clusters with untypical
###   shapes (cube divided into two parts by main diagonal plane)
### Aliases: shapes.blocks3d
### Keywords: cluster,dataset

### ** Examples

library(clusterSim)
library(rgl)
sb3d<-shapes.blocks3d(300,1,3,3,3)
plot3d(sb3d$data,col=rainbow(2)[sb3d$clusters])



