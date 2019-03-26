library(rerf)


### Name: RandMatImagePatch
### Title: Create a Random Matrix: image-patch
### Aliases: RandMatImagePatch

### ** Examples


p <- 28^2
d <- 8
ih <- iw <- 28
pwMin <- 3
pwMax <- 6
paramList <- list(p = p, d = d, ih = ih, iw = iw, pwMin = pwMin, pwMax = pwMax)
set.seed(8)
(a <- do.call(RandMatImagePatch, paramList))



