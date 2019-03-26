library(redR)


### Name: error
### Title: Error measurements of images
### Aliases: error MSE MAE PSNR

### ** Examples

degraded.lenna <- degrade(lenna, noise = 0.05)
MSE(lenna, degraded.lenna)
MAE(lenna, degraded.lenna)
PSNR(lenna, degraded.lenna)
#alternatively it can be done like:
MSE(lenna - degraded.lenna)
MAE(lenna - degraded.lenna)



