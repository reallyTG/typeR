library(gclus)


### Name: vec2distm
### Title: Various utility functions
### Aliases: vec2distm vec2dist lower2upper.tri.inds diag.off clus2memship
###   memship2clus
### Keywords: cluster

### ** Examples

vec <- 1:15
vec2distm(vec)
vec2dist(vec)
diag.off(vec2distm(vec))
lower2upper.tri.inds(5)
clus2memship(list(c(1,3,5),c(2,6),4))
memship2clus(c(1,3,4,2,1,4,2,3,2,3))



