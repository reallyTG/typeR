library(gimms)


### Name: monthlyComposite
### Title: Calculate Monthly Composite Images
### Aliases: monthlyComposite monthlyComposite,RasterStackBrick-method
###   monthlyComposite,character-method

### ** Examples

data("bale3g.v1")

## select layers from 1981 only
fls <- system.file("extdata/inventory_ecv1.rds", package = "gimms")
fls <- readRDS(fls)[1]
rst <- bale3g.v1[[1:12]]

## aggregate to monthly mvc layers
mvc <- monthlyComposite(rst, indices = monthlyIndices(fls))




