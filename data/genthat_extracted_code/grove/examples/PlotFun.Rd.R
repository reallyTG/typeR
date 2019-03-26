library(grove)


### Name: PlotFun
### Title: Function to plot the denoised signal
### Aliases: PlotFun

### ** Examples

data <- wavethresh::DJ.EX(n = 512, noisy = TRUE, rsnr = 5)$doppler
W <- DWT(data)
ans <- Denoise(W)
denoised.data <- InvDWT(ans)
PlotFun(denoised.data)
PlotFun(denoised.data, band.type = "both")



