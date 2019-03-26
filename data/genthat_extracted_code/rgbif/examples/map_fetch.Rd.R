library(rgbif)


### Name: map_fetch
### Title: Fetch aggregated density maps of GBIF occurrences
### Aliases: map_fetch
### Keywords: GBIF map, tile, web

### ** Examples

## Not run: 
##D if (
##D  requireNamespace("png", quietly = TRUE) && 
##D  requireNamespace("raster", quietly = TRUE)
##D ) {
##D   x <- map_fetch(taxonKey = 2480498, year = 2007:2011)
##D   x
##D   # gives a RasterLayer object
##D   class(x)
##D   # visualize
##D   library(raster)
##D   plot(x)
##D 
##D   # different srs
##D   ## 3857
##D   y <- map_fetch(taxonKey = 2480498, year = 2010, srs = "EPSG:3857")
##D   plot(y)
##D   ## 3031
##D   z <- map_fetch(taxonKey = 2480498, year = 2010, srs = "EPSG:3031", verbose = TRUE)
##D   plot(z)
##D   # 3575
##D   z <- map_fetch(taxonKey = 2480498, year = 2010, srs = "EPSG:3575")
##D   plot(z)
##D 
##D   # bin
##D   plot(map_fetch(taxonKey = 212, year = 1998, bin = "hex",
##D      hexPerTile = 30, style = "classic-noborder.poly"))
##D 
##D   # styles
##D   plot(map_fetch(taxonKey = 2480498, style = "purpleYellow.point"))
##D 
##D   # map vector tile, gives back raw bytes
##D   x <- map_fetch(taxonKey = 2480498, year = 2010,
##D     format = ".mvt")
##D   x[1:10]
##D   is.raw(x)
##D 
##D   # query with basisOfRecord
##D   map_fetch(taxonKey = 2480498, year = 2010, 
##D     basisOfRecord = "HUMAN_OBSERVATION")
##D   map_fetch(taxonKey = 2480498, year = 2010, 
##D     basisOfRecord = c("HUMAN_OBSERVATION", "LIVING_SPECIMEN"))
##D  }
## End(Not run)



