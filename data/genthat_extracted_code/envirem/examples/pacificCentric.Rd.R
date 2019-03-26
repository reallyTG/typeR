library(envirem)


### Name: pacificCentric
### Title: Center raster on the Pacific
### Aliases: pacificCentric

### ** Examples

# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
bio1 <- raster(grep('bio_1\\.', rasterFiles, value=TRUE))

pacificCentric(bio1, crop = TRUE)



