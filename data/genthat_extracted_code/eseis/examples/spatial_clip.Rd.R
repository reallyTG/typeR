library(eseis)


### Name: spatial_clip
### Title: Clip values of spatial data.
### Aliases: spatial_clip
### Keywords: eseis

### ** Examples


## load example data set
data(volcano)

## convert matrix to raster object
volcano <- raster::raster(volcano)

## clip values to those > quantile 0.5
volcano_clip <- spatial_clip(data = volcano, 
                                    quantile = 0.5)
                                    
## plot clipped data set
raster::plot(volcano_clip)
                     



