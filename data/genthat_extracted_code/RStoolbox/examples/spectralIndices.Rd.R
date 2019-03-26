library(RStoolbox)


### Name: spectralIndices
### Title: Spectral Indices
### Aliases: spectralIndices

### ** Examples

library(ggplot2)
library(raster)
data(lsat)

## Calculate NDVI
ndvi <- spectralIndices(lsat, red = "B3_dn", nir = "B4_dn", indices = "NDVI")
ndvi
ggR(ndvi, geom_raster = TRUE) +
        scale_fill_gradientn(colours = c("black", "white")) 

## Calculate all possible indices, given the provided bands 
## Convert DNs to reflectance (required to calculate EVI and EVI2)
mtlFile  <- system.file("external/landsat/LT52240631988227CUB02_MTL.txt", package="RStoolbox")
lsat_ref <- radCor(lsat, mtlFile, method = "apref")

SI <- spectralIndices(lsat_ref, red = "B3_tre", nir = "B4_tre")
plot(SI)



