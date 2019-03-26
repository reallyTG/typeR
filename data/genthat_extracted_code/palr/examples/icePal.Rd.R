library(palr)


### Name: icePal
### Title: Sea ice colours
### Aliases: icePal

### ** Examples

## Not run: 
##D library(raster)
##D r <- raster(system.file("extdata", "nt_20140320_f17_v01_s.bin", package = "graticule") )
##D icp <- icePal(palette = TRUE)
##D ## The AMSR colours
##D plot(r, col = icp$col, zlim = range(icp$breaks), 
##D main = sprintf("NSIDC ice \\% %s", format(getZ(r))))
## End(Not run)



