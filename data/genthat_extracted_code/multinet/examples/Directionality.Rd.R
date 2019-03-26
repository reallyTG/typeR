library(multinet)


### Name: Network management: edge directionality
### Title: Controlling edge directionality
### Aliases: 'Network management: edge directionality' set.directed.ml
###   is.directed.ml

### ** Examples

net <- ml.empty()
# Adding some layers, one directed and one undirected
add.layers.ml(net,c("l1","l2"),c(TRUE,FALSE))
# Setting the directionality of inter-layer edges
layers = c("l1","l2")
dir <- data.frame(layers,layers,c(0,1))
set.directed.ml(net,dir)
# retrieving all directionalities
dir <- is.directed.ml(net)
# copying directionalities to a new network
net2 <- ml.empty()
add.layers.ml(net2,c("l1","l2"))
set.directed.ml(net2,dir)



