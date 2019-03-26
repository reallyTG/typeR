library(hyperSpec)


### Name: spc.bin
### Title: Wavelength Binning In order to reduce the spectral resolution
###   and thus gain signal to noise ratio or to reduce the dimensionality
###   of the spectral data set, the spectral resolution can be reduced.
### Aliases: spc.bin
### Keywords: datagen manip

### ** Examples


 spc <- spc.bin (flu, 5)

 plot (flu[1,,425:475])
 plot (spc[1,,425:475], add = TRUE, col = "blue")

 nwl (flu)
 nwl (spc)




