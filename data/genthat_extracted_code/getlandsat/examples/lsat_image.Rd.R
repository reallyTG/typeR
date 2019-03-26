library(getlandsat)


### Name: lsat_image
### Title: Get Landsat image(s)
### Aliases: lsat_image

### ** Examples

## Not run: 
##D # pass an image name
##D (res <- lsat_list(max = 40))
##D tifs <- grep("\\.TIF$", res$Key, value = TRUE)
##D lsat_image(tifs[5])
##D lsat_image(tifs[6])
##D lsat_image(tifs[9])
##D 
##D # caching
##D ## requesting an image you already have will return path if found
##D lsat_image(tifs[5])
## End(Not run)



