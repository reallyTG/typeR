library(FIACH)


### Name: fftN
### Title: Zero Padded 1D Fourier transform
### Aliases: fftN

### ** Examples

x<-matrix(rnorm(101*1000),nrow = 101,ncol = 1000)
system.time(test1<-fftN(x))




