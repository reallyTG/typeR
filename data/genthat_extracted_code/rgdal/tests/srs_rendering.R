suppressPackageStartupMessages(library(rgdal))
getPROJ4VersionInfo()
getGDALVersionInfo()
d <- system.file("vectors", package="rgdal")
shps <- ogrListLayers(d)
sapply(shps, function(l) OGRSpatialRef(d, l))
OGRSpatialRef(file.path(d, "airports.gml"), "airports")
OGRSpatialRef(file.path(d, "ps_cant_31.MIF"), "ps_cant_31")
OGRSpatialRef(file.path(d, "Up.tab"), "Up")
OGRSpatialRef(file.path(d, "test_trk2.gpx"), "tracks")
OGRSpatialRef(file.path(d, "PacoursIKA2.TAB"), "PacoursIKA2")
d <- system.file("pictures", package="rgdal")
f <- c("SP27GTIF.TIF", "cea.tif", "erdas_spnad83.tif", "scaleoffset.vrt",
 "test_envi_class.envi")
for (i in f) {
 #print(i)
 ds <- GDAL.open(file.path(d, i))
 ref <- getProjectionRef(ds)
 GDAL.close(ds)
 #print(ref)
 cat("file: ", i, ", SRS: ", ref, "\n")
}

