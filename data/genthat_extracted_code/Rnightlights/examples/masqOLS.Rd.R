library(Rnightlights)


### Name: masqOLS
### Title: Extract raster pixel values within the boundaries of a polygon
### Aliases: masqOLS

### ** Examples

## Not run: 
##D ctryPoly <- rgdal::readOGR(getPolyFnamePath("KEN"), getCtryShpLyrNames("KEN", 1))
##D ctryRaster <- raster::raster(getCtryRasterOutputFnamePath("KEN", "OLS", "1999"))
##D temp <- NULL
##D KenAdm1Sum <- NULL
##D for (i in 1:length(ctryPoly@polygons))
##D {
##D  temp$name <- as.character(ctryPoly@data$NAME_1[i])
##D  temp$sum <- sum(masqOLS(ctryPoly, ctryRaster, i), na.rm=T)
##D 
##D  KenAdm1Sum <- rbind(KenAdm1Sum)
##D }
## End(Not run)




