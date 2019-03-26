library(ndtv)


### Name: export.dot
### Title: Export a network file as Graphviz .dot formatted text file.
### Aliases: export.dot
### Keywords: IO

### ** Examples

 library(network)
 net <- network.initialize(5)
 net[1,] <-1
 net[2,3] <-2
 export.dot(net,file="testNet.dot")



