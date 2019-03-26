library(hsdar)


### Name: spectra
### Title: Handling spectra
### Aliases: spectra.Speclib spectra spectra<- spectra,Speclib-method
###   spectra<-,Speclib,data.frame-method spectra<-,Speclib,matrix-method
###   spectra<-,Speclib,numeric-method spectra<-,Speclib,RasterBrick-method
###   [,.Spectra,ANY,ANY,ANY-method show,.Spectra-method
###   print,.Spectra-method cellFromCol,Speclib-method
###   cellFromLine,Speclib-method cellFromPolygon,Speclib-method
###   cellFromRow,Speclib-method cellFromRowCol,Speclib-method
###   cellFromRowColCombine,Speclib-method cellFromXY,Speclib-method
###   colFromX,Speclib-method fourCellsFromXY,Speclib-method
###   rowFromY,Speclib-method readAll,Speclib-method
### Keywords: utilities

### ** Examples

data(spectral_data)

## Manual plot of the first spectrum
plot(wavelength(spectral_data), spectra(spectral_data)[1,], type="l")



