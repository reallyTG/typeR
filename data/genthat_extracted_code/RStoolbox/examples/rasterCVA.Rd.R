library(RStoolbox)


### Name: rasterCVA
### Title: Change Vector Analysis
### Aliases: rasterCVA

### ** Examples

library(raster)
## Create example data
data(lsat)
pca <- rasterPCA(lsat)$map

## Do change vector analysis 
cva <- rasterCVA(pca[[1:2]], pca[[3:4]])
cva
plot(cva)



