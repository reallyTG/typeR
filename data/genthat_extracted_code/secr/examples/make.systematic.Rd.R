library(secr)


### Name: make.systematic
### Title: Construct Systematic Detector Design
### Aliases: make.systematic
### Keywords: manip

### ** Examples


mini <- make.grid(nx = 2, ny = 2, spacing = 100)
region <- cbind(x=c(0,2000,2000,0), y=c(0,0,2000,2000))
temp <- make.systematic(25, mini, region, plt = TRUE)
temp <- make.systematic(c(6, 6), mini, region, plt = TRUE,
    rotation = -1)

## Example using shapefile "possumarea.shp" in
## "extdata" folder. By default, each cluster is 
## a single multi-catch detector

## Not run: 
##D 
##D datadir <- system.file("extdata", package = "secr")
##D possumarea <- rgdal::readOGR(dsn = datadir, layer = "possumarea")
##D 
##D possumgrid <- make.systematic(spacing = 100, region =
##D     possumarea, plt = TRUE)
##D 
##D ## or with 2 x 2 clusters
##D possumgrid2 <- make.systematic(spacing = 300,
##D     cluster = make.grid(nx = 2, ny = 2, spacing = 100),
##D     region = possumarea, plt = TRUE, edgemethod =
##D     "allinside")
##D ## label clusters
##D text(cluster.centres(possumgrid2), levels(clusterID
##D     (possumgrid2)), cex=0.7)
##D 
##D ## If you have GPSBabel installed and on the Path
##D ## then coordinates can be projected and uploaded
##D ## to a GPS with `writeGPS', which also requires the
##D ## package `proj4'. Defaults are for a Garmin GPS
##D ## connected by USB.
##D 
##D writeGPS(possumgrid, proj = "+proj=nzmg")
##D 
## End(Not run)




