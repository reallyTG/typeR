library(fftwtools)


### Name: fftw
### Title: Compute fft using fftw3
### Aliases: fftw fftw_c2c fftw_r2c fftw_c2r
### Keywords: fftw

### ** Examples

res <- fftw_r2c(1:9)
res
fftw_c2r(res)/9
res
fftw_c2r(res)/9

res <- fftw_r2c(1:10)
res
fftw_c2r(res)/10
res
fftw_c2r(res)/10

res <- fftw_r2c(1:9, HermConj=0)
res
fftw_c2r(res, HermConj=0, n=9)/9

res <- fftw_r2c(1:10, HermConj=0)
res
fftw_c2r(res, HermConj=0, n=10)/10

fftw_r2c(1:3)
fftw_c2r(fftw_r2c(1:3))/3
fftw_c2r(fftw_r2c(1:2))/2
fftw_c2r(fftw_r2c(1:4))/4


fftw_r2c(1:3, HermConj=1)
fftw_c2r(fftw_r2c(1:3, HermConj=0), HermConj=0, n=3)/3

fftw_c2r(fftw_r2c(1:4, HermConj=0), HermConj=0, n=4)/4
fftw_c2r(fftw_r2c(1:20, HermConj=0), HermConj=0, n=20)/20




