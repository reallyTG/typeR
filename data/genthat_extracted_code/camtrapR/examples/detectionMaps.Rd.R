library(camtrapR)


### Name: detectionMaps
### Title: Generate maps of observed species richness and species presences
###   by station
### Aliases: detectionMaps

### ** Examples


# load station information
data(camtraps)

# load record table
data(recordTableSample)


# create maps
Mapstest <- detectionMaps(CTtable           = camtraps,
                          recordTable       = recordTableSample,
                          Xcol              = "utm_x",
                          Ycol              = "utm_y",
                          stationCol        = "Station",
                          speciesCol        = "Species",
                          writePNG          = FALSE,
                          plotR             = TRUE,
                          printLabels       = TRUE,
                          richnessPlot      = TRUE,
                          addLegend         = TRUE
)


## Not run: 
##D 
##D # with a polygon in the background
##D 
##D # make a dummy polygon for the background
##D poly1 <- Polygon(cbind(c(521500,526500,527000, 521500),c(607500, 608000, 603500, 603500)))
##D poly2 <- Polygons(list(poly1), "s1")
##D poly3 <- SpatialPolygons(list(poly2))
##D 
##D Mapstest2 <- detectionMaps(CTtable           = camtraps,
##D                            recordTable       = recordTableSample,
##D                            Xcol              = "utm_x",
##D                            Ycol              = "utm_y",
##D                            backgroundPolygon = poly3,         # this was added
##D                            stationCol        = "Station",
##D                            speciesCol        = "Species",
##D                            writePNG          = FALSE,
##D                            plotR             = TRUE,
##D                            printLabels       = TRUE,
##D                            richnessPlot      = TRUE,
##D                            addLegend         = TRUE
##D )
##D 
## End(Not run)



