library(grove)


### Name: Denoise
### Title: Bayesian wavelet denoising
### Aliases: Denoise

### ** Examples

data <- wavethresh::DJ.EX(n = 512, noisy = TRUE, rsnr = 5)$doppler
W <- DWT(data)
ans <- Denoise(W)



