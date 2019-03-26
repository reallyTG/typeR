library(fftwtools)


### Name: fftw2d
### Title: Compute a two-dimensional FFT on a matrix using FFTW3
### Aliases: fftw2d fftw_c2c_2d fftw_r2c_2d
### Keywords: fftw

### ** Examples

x=c(1, 2, 3, 9, 8, 5, 1, 2, 9, 8, 7, 2)
x= t(matrix(x, nrow=4))
mvfft(x)
t(mvfft(t(mvfft(x))))
fftw2d(x)
fftw2d(x, HermConj=0)

fftw2d(fftw2d(x), inverse=1)/12
fftw2d(fftw2d(t(x)), inverse=1)/12
fftw_r2c_2d(x)
fftw_r2c_2d(x, HermConj=0)



