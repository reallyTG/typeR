library(spatialwarnings)


### Name: raw_moran
### Title: Spatial correlation at lag 1
### Aliases: raw_moran

### ** Examples


# Spatial correlation of white noise is close to zero
rmat <- matrix(runif(1000) > .5, ncol = 100)
raw_moran(rmat) 




