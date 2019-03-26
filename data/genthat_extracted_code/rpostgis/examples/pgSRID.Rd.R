library(rpostgis)


### Name: pgSRID
### Title: Find (or create) PostGIS SRID based on CRS object.
### Aliases: pgSRID

### ** Examples

## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D conn <- dbConnect(drv, dbname = "dbname", host = "host", port = "5432",
##D     user = "user", password = "password")
##D (crs <- CRS("+proj=longlat"))
##D pgSRID(conn, crs)
##D (crs2 <- CRS(paste("+proj=stere", "+lat_0=52.15616055555555 +lon_0=5.38763888888889",
##D     "+k=0.999908 +x_0=155000 +y_0=463000", "+ellps=bessel",
##D     "+towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812",
##D     "+units=m")))
##D pgSRID(conn, crs2, create.srid = TRUE)
## End(Not run)



