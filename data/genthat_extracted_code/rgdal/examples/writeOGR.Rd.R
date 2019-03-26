library(rgdal)


### Name: writeOGR
### Title: Write spatial vector data using OGR
### Aliases: writeOGR
### Keywords: spatial

### ** Examples

cities <- readOGR(system.file("vectors", package = "rgdal")[1], "cities")
is.na(cities$POPULATION) <- cities$POPULATION == -99
summary(cities$POPULATION)
td <- file.path(tempdir(), "rgdal_examples"); dir.create(td)
# BDR 2016-12-15 (MapInfo driver fails writing to directory with ".")
if(nchar(Sys.getenv("OSGEO4W_ROOT")) > 0) {
    OLDPWD <- getwd()
    setwd(td)
    td <- "."
}
writeOGR(cities, td, "cities", driver="ESRI Shapefile")
try(writeOGR(cities, td, "cities", driver="ESRI Shapefile"))
writeOGR(cities, td, "cities", driver="ESRI Shapefile", overwrite_layer=TRUE)
cities2 <- readOGR(td, "cities")
summary(cities2$POPULATION)
if ("SQLite" %in% ogrDrivers()$name) {
  tf <- tempfile()
  try(writeOGR(cities, tf, "cities", driver="SQLite", layer_options="LAUNDER=NO"))
}
if ("GeoJSON" %in% ogrDrivers()$name) {
  js <- '{
    "type": "MultiPolygon",
    "coordinates": [[[[102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0],
    [102.0, 2.0]]], [[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0],
    [100.0, 0.0]]]]
  }'
  spdf <- readOGR(js, layer='OGRGeoJSON')
  in1_comms <- sapply(slot(spdf, "polygons"), comment)
  print(in1_comms)
  tf <- tempfile()
  writeOGR(spdf, tf, "GeoJSON", driver="GeoJSON")
  #spdf1 <- readOGR(tf, "GeoJSON")
  spdf1 <- readOGR(tf)
  in2_comms <- sapply(slot(spdf1, "polygons"), comment)
  print(in2_comms)
  print(isTRUE(all.equal(in1_comms, in2_comms)))
}
## Not run: 
##D if ("GML" %in% ogrDrivers()$name) {
##D   airports <- try(readOGR(system.file("vectors/airports.gml",
##D     package = "rgdal")[1], "airports"))
##D   if (class(airports) != "try-error") {
##D     writeOGR(cities, paste(td, "cities.gml", sep="/"), "cities", driver="GML")
##D     cities3 <- readOGR(paste(td, "cities.gml", sep="/"), "cities")
##D   }
##D }
## End(Not run)
# The GML driver does not support coordinate reference systems
if ("KML" %in% ogrDrivers()$name) {
  data(meuse)
  coordinates(meuse) <- c("x", "y")
  proj4string(meuse) <- CRS("+init=epsg:28992")
  meuse_ll <- spTransform(meuse, CRS("+proj=longlat +datum=WGS84"))
  writeOGR(meuse_ll["zinc"], paste(td, "meuse.kml", sep="/"), "zinc", "KML")
}
list.files(td)
roads <- readOGR(system.file("vectors", package = "rgdal")[1],
 "kiritimati_primary_roads")
summary(roads)
if (strsplit(getGDALVersionInfo(), " ")[[1]][2] < "2") {
# For GDAL >= 2, the TAB driver may need a BOUNDS layer option
  writeOGR(roads, td, "roads", driver="MapInfo File")
  roads2 <- readOGR(paste(td, "roads.tab", sep="/"), "roads")
  summary(roads2)
}
scot_BNG <- readOGR(system.file("vectors", package = "rgdal")[1], "scot_BNG")
summary(scot_BNG)
if (strsplit(getGDALVersionInfo(), " ")[[1]][2] < "2") {
# For GDAL >= 2, the TAB driver may need a BOUNDS layer option
  writeOGR(scot_BNG, td, "scot_BNG", driver="MapInfo File")
  list.files(td)
  scot_BNG2 <- readOGR(paste(td, "scot_BNG.tab", sep="/"), "scot_BNG",
    addCommentsToPolygons=FALSE)
  summary(scot_BNG2)
}
writeOGR(scot_BNG, td, "scot_BNG", driver="MapInfo File",
 dataset_options="FORMAT=MIF")
list.files(td)
scot_BNG3 <- readOGR(paste(td, "scot_BNG.mif", sep="/"), "scot_BNG")
summary(scot_BNG3)
if(nchar(Sys.getenv("OSGEO4W_ROOT")) > 0) {
    setwd(OLDPWD)
}



