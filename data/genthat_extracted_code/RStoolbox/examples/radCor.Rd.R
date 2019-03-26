library(RStoolbox)


### Name: radCor
### Title: Radiometric Calibration and Correction
### Aliases: radCor

### ** Examples

library(raster)
## Import meta-data and bands based on MTL file
mtlFile  <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", 
                                package="RStoolbox")
metaData <- readMeta(mtlFile)
## No test: 
lsat     <- stackMeta(mtlFile)
## End(No test)

## Don't show: 
lsat <- readAll(lsat)
## End(Don't show)

## Convert DN to top of atmosphere reflectance and brightness temperature
lsat_ref <- radCor(lsat, metaData = metaData, method = "apref")

## Correct DN to at-surface-reflecatance with DOS (Chavez decay model)
## No test: 
lsat_sref <- radCor(lsat, metaData = metaData, method = "dos")
## End(No test)

## Correct DN to at-surface-reflecatance with simple DOS 
## Automatic haze estimation
hazeDN    <- estimateHaze(lsat, hazeBands = 1:4, darkProp = 0.01, plot = TRUE)
lsat_sref <- radCor(lsat, metaData = metaData, method = "sdos", 
                    hazeValues = hazeDN, hazeBands = 1:4)



