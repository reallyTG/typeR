library(psd)


### Name: resample_fft_rcpp
### Title: Resample an fft using varying numbers of sine tapers
### Aliases: resample_fft_rcpp

### ** Examples

fftz <- complex(real=1:8, imaginary = 1:8)
taps <- 1:4
try(resample_fft_rcpp(fftz, taps))



