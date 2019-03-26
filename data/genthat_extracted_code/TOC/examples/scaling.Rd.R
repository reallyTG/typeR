library(TOC)


### Name: scaling
### Title: scale the output TOC values and change units
### Aliases: scaling scaling,Toc-method
### Keywords: methods spatial

### ** Examples

index <- raster(system.file("external/Prob_Map2.rst", package = "TOC"))
boolean <- raster(system.file("external/Change_Map2b.rst", package = "TOC"))
mask <- raster(system.file("external/MASK4.rst", package = "TOC"))
tocd <- TOC(index, boolean, mask, nthres = 100)
plot(tocd)

## scale units from square m to square km
tocd_sqkm <- scaling(tocd, scalingFactor = 1000000, newUnits = "square km")
plot(tocd_sqkm) 



