library(trajectories)


### Name: dists

### Title: Calculate distances between two 'Tracks' objects
### Aliases: dists dists,Tracks,Tracks-method
### Keywords: dists

### ** Examples

## example tracks
library(sp)
library(xts)
data(A3)
track2 <- A3
index(track2@time) <- index(track2@time) + 32
track2@sp@coords <- track2@sp@coords + 0.003

## create Tracks objects
tracks1 <- Tracks(list(A3, track2))
tracks2 <- Tracks(list(track2, A3))

## calculate distances
## Not run: 
##D dists(tracks1, tracks2)
##D dists(tracks1, tracks2, sum)
##D dists(tracks1, tracks2, frechetDist)
## End(Not run)



