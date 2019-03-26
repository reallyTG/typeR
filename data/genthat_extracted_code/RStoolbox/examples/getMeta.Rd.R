library(RStoolbox)


### Name: getMeta
### Title: Extract bandwise information from ImageMetaData
### Aliases: getMeta

### ** Examples

## Import example data
mtlFile  <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", package="RStoolbox")
meta <- readMeta(mtlFile)
lsat <- stackMeta(mtlFile)

## Get integer scale factors
getMeta(lsat, metaData = meta, what = "SCALE_FACTOR")

## Conversion factors for brightness temperature
getMeta("B6_dn", metaData = meta, what = "CALBT")

## Conversion factors to top-of-atmosphere radiance
## Band order not corresponding to metaData order
getMeta(lsat[[5:1]], metaData = meta, what = "CALRAD")

## Get integer scale factors
getMeta(lsat, metaData = meta, what = "SCALE_FACTOR")

## Get file basenames
getMeta(lsat, metaData = meta, what = "FILES")




