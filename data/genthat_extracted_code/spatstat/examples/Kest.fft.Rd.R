library(spatstat)


### Name: Kest.fft
### Title: K-function using FFT
### Aliases: Kest.fft
### Keywords: spatial nonparametric

### ** Examples

 pp <- runifpoint(10000)
 ## Don't show: 
  op <- spatstat.options(npixel=125)
 
## End(Don't show)
 Kpp <- Kest.fft(pp, 0.01)
 plot(Kpp)
 ## Don't show: 
spatstat.options(op)
## End(Don't show)



