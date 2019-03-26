library(fasteraster)


### Name: fasteraster
### Title: Raster Image Processing and Vector Recognition
### Aliases: fasteraster
### Keywords: package

### ** Examples

  ## Not run: 
##D   library(fasteraster);
##D   library(datasets);
##D 
##D   polygons <- raster2vector(volcano, 120, 200, 20, 1);
##D   image(volcano, col = rev(grey.colors(100)), useRaster = TRUE)
##D   plot(0, type = "l", xlim = c(0, nrow(volcano)), ylim = c(0, ncol(volcano)))
##D   a <- lapply(polygons, function(x) lines(rbind(x, x[1,])))
##D 
##D   zones <- rasterZoneAnalyzer(volcano, 120, 200, 20);
##D   a <- text(zones[ , 3], zones[ , 4], labels = zones[ , 2]);
##D   
## End(Not run)



