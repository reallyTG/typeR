library(OpenImageR)


### Name: gamma_correction
### Title: Gamma correction
### Aliases: gamma_correction

### ** Examples


path = system.file("tmp_images", "2.jpg", package = "OpenImageR")

image = readImage(path)

filt = gamma_correction(image, gamma = 0.5)




