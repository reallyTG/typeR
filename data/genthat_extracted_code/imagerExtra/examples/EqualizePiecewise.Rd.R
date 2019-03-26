library(imagerExtra)


### Name: EqualizePiecewise
### Title: Piecewise Affine Histogram Equalization
### Aliases: EqualizePiecewise

### ** Examples

dev.new()
par(mfcol = c(1,2))
boats_g <- grayscale(boats)
plot(boats_g, main = "Original")
EqualizePiecewise(boats_g, 10) %>% plot(., main = "Piecewise Affine Equalization")



