library(RStoolbox)


### Name: readMeta
### Title: Read Landsat MTL metadata files
### Aliases: readMeta

### ** Examples

## Example metadata file (MTL)
mtlFile  <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", package="RStoolbox")

## Read metadata
metaData <- readMeta(mtlFile)

## Summary
summary(metaData)




