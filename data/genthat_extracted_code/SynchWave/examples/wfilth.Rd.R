library(SynchWave)


### Name: wfilth
### Title: FFT of Wavelet Transform Function
### Aliases: wfilth
### Keywords: nonparametric

### ** Examples

tmp <- wfilth("morlet", 1024, 4)
plot(fftshift(tmp$xi/(2*pi)), fftshift(abs(tmp$psih)), type="l", col="blue", xlab="", ylab="")



