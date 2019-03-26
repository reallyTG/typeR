library(GSIF)


### Name: geochm
### Title: NGS database samples for Indiana State
### Aliases: geochm
### Keywords: datasets

### ** Examples

library(sp)

# Load the NGS data:
data(geochm)
coordinates(geochm) <- ~LONGITUDE+LATITUDE
proj4string(geochm) <- CRS("+proj=longlat +ellps=clrk66 +datum=NAD27 +no_defs")
## Not run: 
##D require(plotKML)
##D data(SAGA_pal)
##D # replace the missing values with half the detection limit:
##D geochm$PB_ICP40 <- ifelse(geochm$PB_ICP40 < 0, 2, geochm$PB_ICP40) 
##D shape = "http://maps.google.com/mapfiles/kml/pal2/icon18.png"
##D kml(geochm, shape = shape, colour = log1p(PB_ICP40), labels = "", 
##D     colour_scale = SAGA_pal[[1]], kmz = TRUE)
## End(Not run)



