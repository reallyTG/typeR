library(RStoolbox)


### Name: stackMeta
### Title: Import separate Landsat files into single stack
### Aliases: stackMeta

### ** Examples

library(rgdal)
## Example metadata file (MTL)
mtlFile  <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", package="RStoolbox")

## Read metadata
metaData <- readMeta(mtlFile)
summary(metaData)

## Load rasters based on metadata file
lsat     <- stackMeta(mtlFile)
lsat



