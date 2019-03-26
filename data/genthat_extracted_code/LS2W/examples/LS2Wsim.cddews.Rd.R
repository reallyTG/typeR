library(LS2W)


### Name: LS2Wsim.cddews
### Title: Simulate an LS2W process with underlying Daubechies wavelet.
### Aliases: LS2Wsim.cddews
### Keywords: datagen

### ** Examples


#Generate an empty spectrum
#
Spectrum<-cddews(matrix(0,64,64),smooth=FALSE)
#
#Add power at the first scale, in the vertical direction
#
Spectrum$S[1,,]<-matrix(1,64,64)
#                                                          
# Simulate an LS2W process with this structure
#           
testimage<- LS2Wsim(Spectrum)
#
  


