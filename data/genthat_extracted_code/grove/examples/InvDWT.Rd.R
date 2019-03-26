library(grove)


### Name: InvDWT
### Title: Inverse discrete wavelet transform
### Aliases: InvDWT

### ** Examples

data <- wavethresh::DJ.EX(n = 512, noisy = TRUE, rsnr = 5)$doppler
W <- DWT(data)
ans <- Denoise(W)
denoised.data <- InvDWT(ans)
plot(data, type = "l")
lines(denoised.data[1, ], col = "red")



