library(ProFit)


### Name: profitConvolve
### Title: Performs a convolution using the give convolver object
### Aliases: profitConvolve
### Keywords: PSF convolve convolution

### ** Examples

# Initial images
image = matrix(1, 100, 100)
psf = matrix(1:10000, 100, 100)

# Check for FFTW support and create a convolver
type = "brute"
if (profitHasFFTW()) {
	type = "fft"
}
convolver = profitMakeConvolver(type, c(100, 100), psf, fft_effort=0,
                                omp_threads=2)

# Perform convolution
image = profitConvolve(convolver, image, psf)



