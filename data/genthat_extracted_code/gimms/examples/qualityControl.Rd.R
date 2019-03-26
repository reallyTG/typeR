library(gimms)


### Name: qualityControl
### Title: Perform Quality Control on GIMMS NDVI3g Data
### Aliases: qualityControl qualityControl,RasterStackBrick-method

### ** Examples

## Not run: 
##D tmp <- tempdir()
##D 
##D ## Download NDVI3g.v1 sample data
##D ecocast <- system.file("extdata", "inventory_ecv1.rds", package = "gimms")
##D gimms_files <- downloadGimms(readRDS(ecocast)[1], dsn = tmp)
##D 
##D ## Import data as 'Raster*' objects
##D ndvi <- raster::raster(gimms_files, varname = "ndvi")
##D ndvi[ndvi[] %in% c(-32768, -3000)] <- NA
##D ndvi <- ndvi / 1e4
##D 
##D flag <- floor(raster::raster(gimms_files, varname = "percentile") / 2e3)
##D 
##D ## Perform quality control and visualize
##D to_check <- stack(ndvi[[1]], flag[[1]])
##D qcl <- qualityControl(to_check, keep = 0)
##D 
##D plot(qcl)
## End(Not run)

## see also 'Examples' section in ?rasterizeGimms for automated quality check




