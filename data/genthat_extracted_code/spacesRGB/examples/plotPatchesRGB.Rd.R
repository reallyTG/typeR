library(spacesRGB)


### Name: plotPatchesRGB
### Title: Plot Patches defined by RGB
### Aliases: plotPatchesRGB
### Keywords: RGB

### ** Examples

set.seed(0)
RGB = round( 255 * matrix( runif(6*3), 6, 3 ) )
plotPatchesRGB( RGB, max=255 )



