library(seewave)


### Name: spectro3D
### Title: 3D-spectrogram of a time wave
### Aliases: spectro3D
### Keywords: dplot ts

### ** Examples

## Not run: 
##D require(rgl)
##D data(tico)
##D spectro3D(tico,f=22050,wl=512,ovlp=75,zp=16,maga=4,palette=reverse.terrain.colors)
##D # linear amplitude scale without a normisation of the STFT matrix
##D # time and frequency scales need to be dramatically amplified
##D spectro3D(tico, norm=FALSE, dB=NULL, magt=100000, magf=100000)
## End(Not run)


