library(rsMove)


### Name: labelSample
### Title: labelSample
### Aliases: labelSample

### ** Examples

{

 require(raster)

 # read raster data
 r <- raster(system.file('extdata', '2013-07-16_ndvi.tif', package="rsMove"))

 # read movement data
 data(shortMove)

 # derive region labels
 labels <- labelSample(shortMove, r, agg.radius=60)

}



