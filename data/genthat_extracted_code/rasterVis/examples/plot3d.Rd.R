library(rasterVis)


### Name: plot3D
### Title: Interactive 3D plot of a RasterLayer
### Aliases: plot3D plot3D,RasterLayer-method
### Keywords: methods spatial

### ** Examples
 ## Not run: 
##D ## rgl is needed to use plot3D
##D library(rgl)
##D 
##D data(volcano)
##D r <- raster(volcano)
##D extent(r) <- c(0, 610, 0, 870)
##D 
##D ## level plot as reference
##D levelplot(r, col.regions=terrain.colors)
##D 
##D plot3D(r)
##D ## Use different colors with a predefined function
##D plot3D(r, col=rainbow)
##D ## or with a custom function using colorRampPalette
##D myPal <- colorRampPalette(brewer.pal(11, 'PuOr'))
##D plot3D(r, col=myPal)
##D 
##D ## With at you can define an homogeneus color table for different Rasters
##D 
##D r2 <- r + 100
##D r3 <- r + 200
##D s <- stack(r, r2, r3)
##D 
##D maxVal <- max(maxValue(s))
##D minVal <- min(minValue(s))
##D N <- 40
##D breaks <- seq(minVal, maxVal, length=N)
##D 
##D plot3D(r, at=breaks)
##D plot3D(r2, at=breaks)
##D plot3D(r3, at=breaks)
##D 
##D ## Default: x-axis and y-axis are adjusted with z-values. Therefore,
##D ## labels with decorate3d() are useless
##D plot3D(r, adjust=TRUE)
##D decorate3d()
##D ## Compare the graphic limits
##D par3d('bbox')
##D ## with the extent of the Raster
##D extent(r)
##D 
##D ## Set adjust=FALSE to fix it
##D plot3D(r, adjust=FALSE)
##D decorate3d()
##D ## Once again, compare the graphic limits
##D par3d('bbox')
##D ## with the extent of the Raster
##D extent(r)
##D 
##D ## zfac controls the z values so z-axis will be distorted
##D plot3D(r, adjust=FALSE, zfac=2)
##D decorate3d()
##D par3d('bbox')
##D 
##D 
##D ## With drape you can disconnect the z-axis from the colors
##D drape <- cut(r^4, 4)
##D plot3D(r, drape=drape)
##D ## Compare with:
##D plot3D(r, at=4)
## End(Not run)



