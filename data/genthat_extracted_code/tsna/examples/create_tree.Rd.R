library(tsna)


### Name: as.network.tPath
### Title: Create a network object from a 'tPath' object - the results of a
###   path search
### Aliases: as.network.tPath

### ** Examples

  data(moodyContactSim)
  v1path<-tPath(moodyContactSim,v=1)
  v1tree<-as.network(v1path)
  plot(v1tree,displaylabels=TRUE)



