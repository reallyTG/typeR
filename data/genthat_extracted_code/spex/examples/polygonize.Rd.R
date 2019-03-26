library(spex)


### Name: polygonize
### Title: Create a polygon layer from a raster.
### Aliases: polygonize polygonize.RasterLayer qm_rasterToPolygons
###   qm_rasterToPolygons_sp polygonize polygonize qm_rasterToPolygons
###   polygonize polygonize.RasterStack polygonize polygonize.RasterBrick
###   polygonize qm_rasterToPolygons_sp

### ** Examples

#library(raadtools)
library(raster)
r <- raster(volcano)
r[sample(ncell(r), 3000)] <- NA
b <- brick(r, r*1.5)
psf <- qm_rasterToPolygons(r, na.rm = TRUE)
#psp <- qm_rasterToPolygons_sp(r)
#pspr <- rasterToPolygons(r)
#library(rbenchmark)
#benchmark(qm_rasterToPolygons(r), qm_rasterToPolygons_sp(r), rasterToPolygons(r), replications = 2)
#                        test replications elapsed relative user.self sys.self user.child sys.child
# 1    qm_rasterToPolygons(r)            2   0.476    1.000     0.476    0.000          0         0
# 2 qm_rasterToPolygons_sp(r)            2   4.012    8.429     3.964    0.048          0         0
# 3       rasterToPolygons(r)            2   2.274    4.777     2.268    0.008          0         0



