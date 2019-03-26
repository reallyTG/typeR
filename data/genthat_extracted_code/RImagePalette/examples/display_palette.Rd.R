library(RImagePalette)


### Name: display_palette
### Title: Display color palette
### Aliases: display_palette

### ** Examples

img <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
display_palette(image_palette(img, n=5))



