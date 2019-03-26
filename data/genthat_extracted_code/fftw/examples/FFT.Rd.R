library(fftw)


### Name: FFT
### Title: Calculate (inverse) DFT using the FFT method
### Aliases: FFT IFFT DCT IDCT

### ** Examples

n <- 2**16
x <- rnorm(n)
p <- planFFT(n)
y <- FFT(x, plan=p)

Mod(x - IFFT(FFT(x)))



