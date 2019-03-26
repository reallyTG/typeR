library(cubeview)


### Name: cubeView
### Title: View a RasterStack or RasterBrick as 3-dimensional data cube.
### Aliases: cubeView cubeview

### ** Examples

if (interactive()) {
  library(raster)

  kili_data <- system.file("extdata", "kiliNDVI.tif", package = "cubeview")
  kiliNDVI <- stack(kili_data)

  cubeView(kiliNDVI)

  clr <- viridisLite::viridis
  cubeView(kiliNDVI, at = seq(-0.15, 0.95, 0.1), col.regions = clr)
}




