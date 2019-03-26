library(sparr)


### Name: fft2d
### Title: 2D fast-Fourier wrapper around 'fftwtools' or 'stats' package
### Aliases: fft2d

### ** Examples

## No test: 

# System check
sparr:::fftw_available()

system.time(fft(matrix(1:2000^2,2000)))
system.time(fft2d(matrix(1:2000^2,2000)))
## End(No test)




