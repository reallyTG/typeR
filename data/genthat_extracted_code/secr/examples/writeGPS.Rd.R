library(secr)


### Name: writeGPS
### Title: Upload to GPS
### Aliases: writeGPS
### Keywords: IO

### ** Examples


## Example using shapefile "possumarea.shp" in
## "extdata" folder. As 'cluster' is not specified,
## the grid comprises single multi-catch detectors.

## Not run: 
##D 
##D datadir <- system.file("extdata", package = "secr")
##D possumarea <- rgdal::readOGR(dsn = datadir, layer = "possumarea")
##D 
##D possumgrid <- make.systematic(spacing = 100, region =
##D     possumarea, plt = TRUE)
##D 
##D ## May upload directly to GPS...
##D writeGPS(possumgrid, proj = "+proj=nzmg")
##D 
##D ## ...or save as Mapsource file
##D writeGPS(possumgrid, o = "gdb", F = "tempgrid.gdb",
##D     proj = "+proj=nzmg")
##D 
##D ## If `region' had been specified in another projection we
##D ## would need to specify this as in Proj.4. Here is a
##D ## hypothetical example for New Zealand Transverse Mercator
##D ## with datum NZGD2000 (EPSG:2193)
##D 
##D NZTM <- paste("+proj=tmerc +lat_0=0 +lon_0=173 +k=0.9996",
##D     "+x_0=1600000 +y_0=10000000 +ellps=GRS80",
##D     " +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
##D 
##D writeGPS(possumgridNZTM, o = "gdb", F = "tempNZTM.txt", 
##D     proj = NZTM)
##D 
##D ## Or to upload coordinates from UTM Zone 18 in eastern
##D ## Maryland, USA...
##D 
##D writeGPS(MarylandUTMgrid, proj =
##D     "+proj=utm +zone=18 +ellps=WGS84")
##D 
## End(Not run)




