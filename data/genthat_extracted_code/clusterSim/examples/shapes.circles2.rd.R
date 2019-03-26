library(clusterSim)


### Name: shapes.circles2
### Title: Generation of data set containing two clusters with untypical
###   ring shapes (circles)
### Aliases: shapes.circles2 shapes.bulls.eye
### Keywords: cluster,dataset

### ** Examples

#Example1
library(clusterSim)
sc2<-shapes.circles2(180)
plot(sc2$data,col=rainbow(2)[sc2$clusters])

#Example2
library(clusterSim)
sbe<-shapes.bulls.eye(numObjects=c(120,60))
plot(sbe$data,col=rainbow(2)[sbe$clusters])



