library(redR)


### Name: fft_convolve
### Title: Convolution of two images via FFT
### Aliases: fft_convolve

### ** Examples

im <- lenna
filter <- imfill(9,9,val = 1)
blurred.im <- fft_convolve(im, filter)
deblurred.im <- fft_convolve(blurred.im, filter, deconvolution = TRUE)
par(mfrow = c(1,3), mar = c(0,0,1,0)+0.1)
plot(im, axes = FALSE, interp = FALSE, main = 'Original Lenna')
plot(blurred.im, axes = FALSE, interp = FALSE, main = 'Blurred Lenna')
plot(deblurred.im, axes = FALSE, interp = FALSE, main = 'deBlurred Lenna')
PSNR(im, blurred.im)
PSNR(im, deblurred.im)



