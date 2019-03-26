library(gimms)


### Name: rasterizeGimms
### Title: Rasterize GIMMS NDVI3g Data
### Aliases: rasterizeGimms

### ** Examples

## Not run: 
##D tmp <- tempdir()
##D 
##D ## Download NDVI3g.v1 sample data
##D gimms_files <- downloadGimms(x = as.Date("2000-01-01"),
##D                              y = as.Date("2000-12-31"),
##D                              dsn = tmp)
##D 
##D ## Extent for clipping
##D shp <- getData("GADM", country = "DEU", level = 0, path = tmp)
##D 
##D ## Rasterize without quality control
##D gimms_raster <- rasterizeGimms(x = gimms_files,
##D                                ext = shp) # clipping
##D plot(gimms_raster[[1]])
##D lines(shp)
##D 
##D ## Rasterize with quality control
##D gimms_rasterq <- rasterizeGimms(x = gimms_files,
##D                                 ext = shp, # clipping
##D                                 keep = 0)  # quality control
##D plot(gimms_rasterq[[1]])
##D lines(shp)
## End(Not run)




