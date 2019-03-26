library(RImagePalette)


### Name: image_palette
### Title: Create image palette
### Aliases: image_palette

### ** Examples

img <- jpeg::readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
display_image(img)
scales::show_col(image_palette(img, n=5))



