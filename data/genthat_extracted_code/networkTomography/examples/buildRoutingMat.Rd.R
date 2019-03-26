library(networkTomography)


### Name: buildRoutingMat
### Title: Build routing matrices for linked star topologies; that is, a
###   set of star-topology networks with links between a subset of routers
### Aliases: buildRoutingMat

### ** Examples

nVec <- c(3, 3, 3)
Cmat <- diag(3)
Cmat[1,2] <- Cmat[2,3] <- 1
buildRoutingMat(nVec, Cmat)



