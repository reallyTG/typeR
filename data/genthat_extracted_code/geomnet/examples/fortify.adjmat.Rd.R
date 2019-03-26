library(geomnet)


### Name: fortify.adjmat
### Title: Function for converting a network adjacency matrix into the
###   correct format for use with geomnet
### Aliases: fortify.adjmat

### ** Examples

data(emon, package = "network")
adjmat <- as.adjmat(network::as.matrix.network.adjacency(emon$MtSi))
str(adjmat)
fortify(adjmat)



