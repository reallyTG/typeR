library(fftwtools)


### Name: mvfftw
### Title: Compute the FFT on each column of a matrix using FFTW3
### Aliases: mvfftw mvfftw_c2c mvfftw_r2c mvfftw_c2r
### Keywords: fftw

### ** Examples

x=c(1, 2, 3, 9, 8, 5, 1, 2, 9, 8, 7, 2)
x= t(matrix(x, nrow=4))
mvfft(x)
t(mvfft(t(mvfft(x))))

res <- mvfftw_r2c(x, HermConj=1)
res
mvfftw_c2c(res, inverse=1)/3
mvfftw_c2r(res)/3

res <- mvfftw_r2c(x, HermConj=0)
res
mvfftw_c2r(res, HermConj=0, n=3)/3


mvfftw_r2c(x, HermConj=1)
mvfft(x)
res <- mvfftw_r2c(x, HermConj=0)
res
mvfftw_c2r(res, HermConj=0, n=3)/3

res <- mvfftw_r2c(t(x), HermConj=1)
res
mvfftw_c2r(res, HermConj=1)/4
res <- mvfftw_r2c(t(x), HermConj=0)
res
mvfftw_c2r(res, HermConj=0, n=4)/4


mvfftw_r2c(t(x), HermConj=1)
mvfft(t(x))

mvfftw(mvfftw(x, HermConj=0), inverse=1, HermConj=0, n=3)/3
mvfftw(mvfftw(t(x), HermConj=0), inverse=1, HermConj=0, n=4)/4
mvfftw(mvfftw(t(x), inverse=1))/4



