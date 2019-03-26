library(mapi)


### Name: MAPI_GridHexagonal
### Title: Function MAPI_GridHexagonal
### Aliases: MAPI_GridHexagonal

### ** Examples

data("samples")
# Builds a grid of hexagonal cells according to samples coordinates (columns x and y) 
# using the EPSG:3857 projection and an halfwidth cell value of hw=250m.
grid <- MAPI_GridHexagonal(samples, crs=3857, hw=250)




