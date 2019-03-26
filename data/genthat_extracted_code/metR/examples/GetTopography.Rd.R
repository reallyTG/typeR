library(metR)


### Name: GetTopography
### Title: Get topographic data
### Aliases: GetTopography

### ** Examples

## Not run: 
##D topo <- GetTopography(280, 330, 0, -60, resolution = 0.5, verbose = FALSE)
##D library(ggplot2)
##D ggplot(topo, aes(lon, lat)) +
##D     geom_raster(aes(fill = h)) +
##D     geom_contour(aes(z = h), breaks = 0, color = "black", size = 0.3) +
##D     scale_fill_gradient2(low = "steelblue", high = "goldenrod2", mid = "olivedrab") +
##D     coord_quickmap()
## End(Not run)



