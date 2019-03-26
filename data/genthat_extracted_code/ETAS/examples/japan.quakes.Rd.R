library(ETAS)


### Name: japan.quakes
### Title: A Japanese Earthquake Catalog
### Aliases: japan.quakes jap.quakes
### Keywords: datasets spatial earthquak

### ** Examples

  # set the target polygonal study region
  jpoly <- list(long=c(134.0, 137.9, 143.1, 144.9, 147.8,
      137.8, 137.4, 135.1, 130.6), lat=c(31.9, 33.0, 33.2,
      35.2, 41.3, 44.2, 40.2, 38.0, 35.4))

  # creat an earthquake catalog
  japan.cat <- catalog(japan.quakes, study.start="1953-05-26",
      study.end="1990-01-08", region.poly=jpoly, mag.threshold=4.5)

  ## Not run: 
##D   plot(japan.cat)
## End(Not run)

  param0 <- c(0.592844590, 0.204288231, 0.022692883, 1.495169224,
  1.109752319, 0.001175925, 1.860044210, 1.041549634)

  ## Not run: 
##D   nthreads <- parallel::detectCores()
##D   japan.fit <- etas(japan.cat, param0, nthreads=nthreads)
## End(Not run)




