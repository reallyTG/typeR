library(RStoolbox)


### Name: topCor
### Title: Topographic Illumination Correction
### Aliases: topCor

### ** Examples

## Load example data
metaData <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", package="RStoolbox")
metaData <- readMeta(metaData)
lsat     <- stackMeta(metaData) 
data(srtm)
## Don't show: 
data(lsat)
## End(Don't show)

## Minnaert correction, solar angles from metaData
lsat_minnaert <- topCor(lsat, dem = srtm, metaData = metaData, method = "minnaert")

## C correction, solar angles provided manually
lsat_C <- topCor(lsat, dem = srtm, solarAngles = c(1.081533, 0.7023922), method = "C")




