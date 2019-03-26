library(SpatialTools)


### Name: coincident
### Title: Determine coincident coordinates
### Aliases: coincident

### ** Examples

#Generate two sets of coordinates
loc1 <- as.matrix(expand.grid(seq(0, 1, len = 25), seq(0, 1, len = 25)))
loc2 <- as.matrix(expand.grid(seq(0, 1, len = 101), seq(0, 1, len = 101)))
coincident(loc1, loc2)



