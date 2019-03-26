library(rsMove)


### Name: plausibilityTest
### Title: plausibilityTest
### Aliases: plausibilityTest

### ** Examples

{

 require(raster)

 # load example probability image
 file <- system.file('extdata', 'probabilities.tif', package="rsMove")
 p <- raster(file) > 0.5

 # land cover map
 lc <- raster(system.file('extdata', 'landCover.tif', package="rsMove"))

 # segment probabilities
 pt <- plausibilityTest(p, lc)

 # show plot
 pt$relative.plot

 # see relative sample count
 head(pt$relative.count)

}



