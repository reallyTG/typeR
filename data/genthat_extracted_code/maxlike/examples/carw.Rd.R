library(maxlike)


### Name: carw
### Title: The Carolina Wren data used by Royle et al. (2012)
### Aliases: carw carw.data
### Keywords: datasets

### ** Examples

data(carw)

# Convert data frame to a list of rasters
rl <- lapply(carw.data$raster.data, function(x) {
   m <- matrix(x, nrow=carw.data$dim[1], ncol=carw.data$dim[2],
               byrow=TRUE)
   r <- raster(m)
   extent(r) <- carw.data$ext
   r
})

# Stack and name them
rs <- stack(rl[[1]], rl[[2]], rl[[3]], rl[[4]], rl[[5]], rl[[6]])
names(rs) <- names(carw.data$raster.data)

plot(rs)




