library(hsdar)


### Name: speclib
### Title: Methods to create objects of class Speclib
### Aliases: speclib print,Speclib-method $,Speclib-method
###   show,Speclib-method initialize,Speclib-method is.speclib
###   speclib,matrix,numeric-method
###   speclib,SpatialGridDataFrame,numeric-method
###   speclib,numeric,numeric-method speclib,matrix,data.frame-method
###   speclib,SpatialGridDataFrame,data.frame-method
###   speclib,numeric,data.frame-method speclib,matrix,matrix-method
###   speclib,SpatialGridDataFrame,matrix-method
###   speclib,numeric,matrix-method speclib,HyperSpecRaster,ANY-method
###   speclib,RasterBrick,data.frame-method
###   speclib,RasterBrick,matrix-method speclib,RasterBrick,numeric-method
###   speclib,hyperSpec,ANY-method speclib,hyperSpec-method
###   speclib,character,numeric-method ncol,.Spectra-method
###   nrow,.Spectra-method speclib,Speclib,numeric-method
### Keywords: classes

### ** Examples

data(spectral_data)
spectra <- spectra(spectral_data)
wavelength <- spectral_data$wavelength

spectra <- speclib(spectra,wavelength)



