library(imager)


### Name: imnoise
### Title: Generate (Gaussian) white-noise image
### Aliases: imnoise

### ** Examples

imnoise(100,100,cc=3) %>% plot(main="White noise in RGB")
imnoise(100,100,cc=3) %>% isoblur(5) %>% plot(main="Filtered (non-white) noise")
imnoise(dim=dim(boats)) #Noise image of the same size as the boats image



