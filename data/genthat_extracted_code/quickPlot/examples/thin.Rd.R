library(quickPlot)


### Name: thin
### Title: Thin a polygon using 'fastshp::thin'
### Aliases: thin thin.SpatialPolygons thin.default

### ** Examples

library(raster)

b <- SpatialPoints(cbind(-110, 59, 1000))
crs(b) <- sp::CRS("+init=epsg:4326")

crsObj <- CRS(paste0("+proj=tmerc +lat_0=0 +lon_0=-115 +k=0.9992 +x_0=500000 +y_0=0 ",
                     "+datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"))

# make a random polygon -- code adapted from SpaDES.tools::randomPolygon package:
  areaM2 <- 1000 * 1e4 * 1.304 # rescale so mean area is close to hectares
  b <- spTransform(b, crsObj)

  radius <- sqrt(areaM2 / pi)

  meanX <- mean(coordinates(b)[, 1]) - radius
  meanY <- mean(coordinates(b)[, 2]) - radius

  minX <- meanX - radius
  maxX <- meanX + radius
  minY <- meanY - radius
  maxY <- meanY + radius

# Add random noise to polygon
  xAdd <- round(runif(1, radius * 0.8, radius * 1.2))
  yAdd <- round(runif(1, radius * 0.8, radius * 1.2))
  nPoints <- 20
  betaPar <- 0.6
  X <- c(jitter(sort(rbeta(nPoints, betaPar, betaPar) * (maxX - minX) + minX)),
        jitter(sort(rbeta(nPoints, betaPar, betaPar) * (maxX - minX) + minX, decreasing = TRUE)))
  Y <- c(jitter(sort(rbeta(nPoints / 2, betaPar, betaPar) * (maxY - meanY) + meanY)),
         jitter(sort(rbeta(nPoints, betaPar, betaPar) * (maxY - minY) + minY, decreasing = TRUE)),
         jitter(sort(rbeta(nPoints / 2, betaPar, betaPar) * (meanY - minY) + minY)))

  Sr1 <- Polygon(cbind(X + xAdd, Y + yAdd))
  Srs1 <- Polygons(list(Sr1), "s1")
  a <- SpatialPolygons(list(Srs1), 1L)
  crs(a) <- crsObj
# end of making random polygon

clearPlot()
Plot(a)
NROW(a@polygons[[1]]@Polygons[[1]]@coords)
if (require(fastshp)) {
  aThin <- quickPlot::thin(a, 200)
  NROW(aThin@polygons[[1]]@Polygons[[1]]@coords) # fewer
  Plot(aThin) # looks similar
}

# compare -- if you have rgeos
# if (require("rgeos")) {
#   aSimplify <- gSimplify(a, tol = 200)
#   NROW(aSimplify@polygons[[1]]@Polygons[[1]]@coords) # fewer
#   Plot(aSimplify)
# }

# compare -- if you have sf
# if (require("sf")) {
#   aSF <- st_simplify(st_as_sf(a), dTolerance = 200)
#   # convert to Spatial to see how many coordinates
#   aSF2 <- as(aSF, "Spatial")
#   NROW(aSF2@polygons[[1]]@Polygons[[1]]@coords) # fewer
#   Plot(aSF)
# }

# thin is faster than rgeos::gSimplify and sf::st_simplify on large shapefiles
## Not run: 
##D   # this involves downloading a 9 MB file
##D   setwd(tempdir())
##D   albertaEcozoneFiles <- c("Natural_Regions_Subregions_of_Alberta.dbf",
##D                            "Natural_Regions_Subregions_of_Alberta.lyr",
##D                            "Natural_Regions_Subregions_of_Alberta.prj",
##D                            "Natural_Regions_Subregions_of_Alberta.shp.xml",
##D                            "Natural_Regions_Subregions_of_Alberta.shx",
##D                            "natural_regions_subregions_of_alberta.zip",
##D                            "nsr2005_final_letter.jpg", "nsr2005_final_letter.pdf")
##D   albertaEcozoneURL <- paste0("https://www.albertaparks.ca/media/429607/",
##D                               "natural_regions_subregions_of_alberta.zip")
##D   albertaEcozoneFilename <- "Natural_Regions_Subregions_of_Alberta.shp"
##D   zipFilename <- basename(albertaEcozoneURL)
##D   download.file(albertaEcozoneURL, destfile = zipFilename)
##D   unzip(zipFilename, junkpaths = TRUE)
##D   a <- raster::shapefile(albertaEcozoneFilename)
##D 
##D   # compare -- if you have rgeos and sf package
##D   # if (require("sf")) {
##D   #   aSF <- st_as_sf(a)
##D   # }
##D   # if (require("rgeos") && require("sf")) {
##D     # thin at 10m
##D     microbenchmark::microbenchmark(times = 20
##D                                    , thin(a, 10),
##D                                    , thin(a, 10, returnDataFrame = TRUE) # much faster
##D    #                               , gSimplify(a, 10),
##D    #                               , st_simplify(aSF, dTolerance = 10))
##D                                   )
##D    # Unit: milliseconds
##D    #                              expr      min   median      max neval cld
##D    # thin(a, 10)                        989.812 1266.393 1479.879     6  a
##D    # gSimplify(a, 10   )               4020.349 4211.414 8881.535     6   b
##D    # st_simplify(aSF, dTolerance = 10) 4087.343 4344.936 4910.299     6   b
##D   #}
## End(Not run)



