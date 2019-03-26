library(AFM)


### Name: shiftFFT2D
### Title: Shift the quadrants of the FFT 2D
### Aliases: shiftFFT2D

### ** Examples

library(AFM)
library(fftwtools)

data(AFMImageOfNormallyDistributedHeights)
AFMImage<-AFMImageOfNormallyDistributedHeights
nMheightsData= matrix(AFMImage@data$h, nrow=AFMImage@samplesperline)
shiftedFFT2D<-shiftFFT2D(fftwtools::fftw2d(nMheightsData))



