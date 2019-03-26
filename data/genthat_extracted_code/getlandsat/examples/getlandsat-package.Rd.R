library(getlandsat)


### Name: getlandsat-package
### Title: getlandsat - get Landsat 8 data from AWS public data sets
### Aliases: getlandsat-package getlandsat
### Keywords: package

### ** Examples

## Not run: 
##D ## List scenes
##D (res <- lsat_scenes(n_max = 10))
##D 
##D ## List scene files
##D lsat_scene_files(x = res$download_url[1])
##D 
##D ## Get an image
##D ### Returns path to the image
##D lsat_image(x = "LC80101172015002LGN00_B5.TIF")
##D 
##D ## Visualize
##D if (requireNamespace("raster")) {
##D   library("raster")
##D   x <- lsat_cache_details()[[1]]
##D   img <- raster(x$file)
##D   plot(img)
##D }
## End(Not run)



