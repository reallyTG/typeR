library(rasterVis)


### Name: gplot-methods
### Title: Use ggplot to plot a Raster* object
### Aliases: gplot gplot,Raster-method
### Keywords: methods spatial

### ** Examples
 
## Not run: 
##D r <- raster(system.file("external/test.grd", package="raster"))
##D s <- stack(r, r*2)
##D names(s) <- c('meuse', 'meuse x 2')
##D 
##D library(ggplot2)
##D 
##D theme_set(theme_bw())
##D gplot(s) + geom_tile(aes(fill = value)) +
##D           facet_wrap(~ variable) +
##D           scale_fill_gradient(low = 'white', high = 'blue') +
##D           coord_equal()
## End(Not run)



