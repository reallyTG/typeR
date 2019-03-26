library(envirem)


### Name: layerCreation
### Title: Creates all layers
### Aliases: layerCreation

### ** Examples

## No test: 
# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)

# create stack of temperature and precipitation rasters
# and stack of solar radiation rasters
solradFiles <- grep('solrad', rasterFiles, value=TRUE)
worldclim <- stack(setdiff(rasterFiles, solradFiles))
solar <- stack(solradFiles)

# generate all possible envirem variables
layerCreation(worldclim, solar, var='all', tempScale = 10)
## End(No test)



