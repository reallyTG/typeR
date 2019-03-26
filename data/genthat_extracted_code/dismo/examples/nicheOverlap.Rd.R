library(dismo)


### Name: nicheOverlap
### Title: Niche overlap
### Aliases: nicheOverlap

### ** Examples

r1 <- raster(nr=18, nc=36)
r2 <- raster(nr=18, nc=36)
set.seed(0)
r1[] <- runif(ncell(r1))
r2[] <- runif(ncell(r1))
nicheOverlap(r1, r2)



