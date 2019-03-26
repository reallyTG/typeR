library(imagerExtra)


### Name: DenoiseDCT
### Title: denoise image by DCT denoising
### Aliases: DenoiseDCT

### ** Examples

dev.new()
par(mfcol = c(1,2))
boats_g <- grayscale(boats)
boats_noisy <- imnoise(dim = dim(boats_g), sd = 0.05) + boats_g 
plot(boats_noisy, main = "Noisy Boats")
DenoiseDCT(boats_g, 0.05) %>% plot(., main = "Denoised Boats")



