library(mkde)


### Name: writeRasterToXDMF
### Title: Write a 2D raster to XDMF XML wrapper and binary data file.
### Aliases: writeRasterToXDMF

### ** Examples

library(raster)
data(condordem)
# Save as XDMF (notice no file extension in file name)
writeRasterToXDMF(condordem, "condor_dem")



