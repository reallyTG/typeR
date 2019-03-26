library(ClustGeo)


### Name: inertdiss
### Title: Pseudo inertia of a cluster
### Aliases: inertdiss

### ** Examples

data(estuary)
n <- nrow(estuary$dat)
Z <- scale(estuary$dat)*sqrt(n/(n-1))
inertdiss(dist(Z)) # pseudo inertia
inert(Z) #equals for euclidean distance

w <- estuary$map@data$POPULATION # non uniform weights 
inertdiss(dist(Z),wt=w)



