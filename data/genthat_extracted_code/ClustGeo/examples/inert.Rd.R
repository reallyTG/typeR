library(ClustGeo)


### Name: inert
### Title: Inertia of a cluster
### Aliases: inert

### ** Examples

data(estuary)
n <- nrow(estuary$dat)
Z <- scale(estuary$dat)*sqrt(n/(n-1))
inert(Z) # number of variables

w <- estuary$map@data$POPULATION # non uniform weights 
inert(Z,wt=w)



