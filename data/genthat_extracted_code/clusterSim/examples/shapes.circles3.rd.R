library(clusterSim)


### Name: shapes.circles3
### Title: Generation of data set containing three clusters with untypical
###   ring shapes (circles)
### Aliases: shapes.circles3
### Keywords: cluster,dataset

### ** Examples

#Example1
library(clusterSim)
sc3a<-shapes.circles3(180)
plot(sc3a$data,col=rainbow(3)[sc3a$clusters])

#Example2
library(clusterSim)
sc3b<-shapes.circles3(numObjects=c(120,180,240))
plot(sc3b$data,col=rainbow(3)[sc3b$clusters])



