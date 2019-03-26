library(clusterSim)


### Name: shapes.two.moon
### Title: Generation of data set containing two clusters with untypical
###   shapes (similar to waxing and waning crescent moon)
### Aliases: shapes.two.moon
### Keywords: cluster,dataset

### ** Examples

library(clusterSim)
stm<-shapes.two.moon(180)
plot(stm$data,col=rainbow(2)[stm$clusters])



