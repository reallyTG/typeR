library(RImagePalette)


### Name: quantize_image
### Title: Quantize image
### Aliases: quantize_image

### ** Examples

img <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
quant_img <- quantize_image(img, n=3)
display_image(img)
display_image(quant_img)



