library(landscapetools)


### Name: util_raster2tibble
### Title: Converts raster data into tibble
### Aliases: util_raster2tibble

### ** Examples

maptib <- util_raster2tibble(fbmmap)
## Not run: 
##D library(ggplot2)
##D ggplot(maptib, aes(x,y)) +
##D     coord_fixed() +
##D     geom_raster(aes(fill = z))
## End(Not run)



